require_relative 'instance_counter.rb'

class Train
  include InstanceCounter
  include Manufacturer
  attr_reader :speed, :type, :wagons, :route, :number

  @@trains = []

  def self.find(number)
    selected_train = @@trains.select { |train| train.number == number}
    unless selected_train.empty?
      selected_train
    end
  end

  def initialize(number, type)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
    register_instance
    @@trains << self
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
end
