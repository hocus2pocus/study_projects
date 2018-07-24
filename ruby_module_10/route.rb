require_relative 'instance_counter.rb'
require_relative 'classes_notifications.rb'
require_relative 'acсessors.rb'
require_relative 'validation.rb'

class Route
  include ClassesNotifications
  include InstanceCounter
  include Acсessors
  include Validation

  attr_reader :stations
  strong_attr_accessor :station_first, Station
  strong_attr_accessor :station_last, Station

  validate :station_first, :type, Station
  validate :station_last, :type, Station

  def initialize(station_first, station_last)
    @stations = [station_first, station_last]
    @station_first = station_first
    @station_last = station_last
    validate!
  end

  def add_station(station)
    @stations.insert(1, station)
  end

  def delete_station(station)
    return unless @stations.include?(station)
    @stations.delete(station)
  end

  def show_stations
    stations.each.with_index(1) do |station, index|
      puts "#{index} - #{station.name}"
    end
  end
end
