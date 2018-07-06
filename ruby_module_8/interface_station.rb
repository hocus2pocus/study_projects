module InterfaceStation
  def create_station
    station_name_input
    station_name = gets.chomp
    @stations << Station.new(station_name)
    successful_creation_station(station_name)
    rescue
      retry
  end

  def trains_on_station
    stations_check
    station = choose_station
    station.show_trains
  end

  def all_stations_info
    return if @stations.empty?
    @stations.each do |station|
      puts '*** *** ***'
      puts station.name
      if !station.trains.empty?
        station.each_train { |train| puts "Поезд № #{train.number} - тип #{train.type} - #{train.wagons.count} вагонов" }
      else
        no_trains_message
      end
      puts '*** *** ***'
    end
  end
end
