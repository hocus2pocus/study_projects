require_relative 'instance_counter.rb'
require_relative 'classes_notifications.rb'
require_relative 'validation.rb'
require_relative 'acсessors.rb'

class Station
  include ClassesNotifications
  include InstanceCounter
  include Validation
  include Acсessors

  attr_reader :trains, :name
  strong_attr_accessor :name, String
  attr_accessor_with_history :trains

  validate :name, :type, String
  validate :name, :presence

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
      puts "#{index} - тип: #{train.type} - #{train.wagons.count} вагон/вагонов"
    end
  end

  def each_train
    @trains.each { |train| yield(train) }
  end
end
