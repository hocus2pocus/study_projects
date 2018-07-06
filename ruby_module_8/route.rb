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
    @stations.delete(station) unless [@stations.first, @stations.last].include?(station)
  end

  def show_stations
    stations.each.with_index(1) do |station, index|
      puts "#{index} - #{station.name}"
    end
  end

  protected

  def validate!
    # raise invalid_station unless @stations.first.kind_of?(Station)
    # raise invalid_station unless @stations.last.kind_of?(Station)
    raise invalid_station unless @stations.all? { |station| station.kind_of?(Station) }
    raise same_station if @stations.first.eql?(@stations.last)
  end
end
