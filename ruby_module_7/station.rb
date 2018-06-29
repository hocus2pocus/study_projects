require_relative 'instance_counter.rb'
require_relative 'classes_support.rb'
require_relative 'validation.rb'

class Station
  include ClassesSupport
  include InstanceCounter
  include Validation
  attr_reader :trains, :name

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    validate!
    register_instance
    @@stations << self
  end

  def take_train(train)
    @trains << train
  end

  def trains_by_type(type)
    @trains.count { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_trains
    @trains.each.with_index(1) do |train, index|
      puts "#{index} - тип: #{train.type} - #{train.wagons.count} вагон / вагонов"
    end
  end

  protected

  def validate!
    raise invalid_name if name.nil?
    raise invalid_name if name.empty?
    raise invalid_name unless name.kind_of?(String)
  end
end
