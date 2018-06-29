require_relative 'instance_counter.rb'
require_relative 'manufacturer.rb'
require_relative 'interface_support.rb'
require_relative 'validation.rb'

class Train
  include InterfaceSupport
  include InstanceCounter
  include Manufacturer
  include Validation
  attr_reader :speed, :type, :wagons, :route, :number

  NUMBER = /^([0-9]|[a-z]){3}-?([0-9]|[a-z]){2}$/i

  @@trains = {}

  def self.find(number)
    @@trains[number.to_s]
  end

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
    validate!
    register_instance
    successful_creation
    @@trains[number] = self
  end

  def add_wagon(wagon)
    return if speed != 0
    @wagons << wagon
  end

  def remove_wagon(wagon)
    return if speed != 0

    if !@wagons.empty?
      @wagons.delete(wagon)
    end
  end

  def set_route(route)
    @route = route
    @route.stations.first.take_train(self)
    @current_station_index = 0
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def previous_station
    return if current_station == @route.stations.first
    @route.stations[@current_station_index - 1]
  end

  def next_station
    return if current_station == @route.stations.last
    @route.stations[@current_station_index + 1]
  end

  def backward
    return unless previous_station
      current_station.send_train(self)
      previous_station.take_train(self)
      @current_station_index -= 1
  end

  def forward
    return unless next_station
      current_station.send_train(self)
      next_station.take_train(self)
      @current_station_index += 1
  end

  def speed_up(value)
    return if value < 0
    @speed += value
  end

  def speed_down(value)
    return if value < 0
    @speed -= value
    @speed = 0 if @speed < 0
  end

  protected

  def validate!
    raise RuntimeError, invalid_number if number.nil?
    raise RuntimeError, invalid_number if number !~ NUMBER
    raise RuntimeError, invalid_type unless type == :Cargo || :Passenger
    true
  end
end
