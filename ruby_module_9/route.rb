require_relative 'instance_counter.rb'
require_relative 'classes_notifications.rb'

class Route
  include ClassesNotifications
  include InstanceCounter
  attr_reader :stations

  def initialize(station_first, station_last)
    @stations = [station_first, station_last]
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

  protected

  def validate!
    raise invalid_station unless @stations.all?(Station)
    raise same_station if @stations.first.eql?(@stations.last)
  end
end
