module InterfaceStation
  def create_station
    station_name_input
    station_name = gets.chomp
    @stations << Station.new(station_name)
    successful_creation_station(station_name)
  rescue StandardError
    retry
  end

  def trains_on_station
    stations_check
    station = choose_station
    station.show_trains
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def all_stations_info
    return if @stations.empty?
    @stations.each do |station|
      puts '*** *** ***'
      puts station.name
      if !station.trains.empty?
        station.each_train do |train|
          puts %(Поезд № #{train.number} -
          тип #{train.type} - #{train.wagons.count} вагонов)
        end
      else
        no_trains_message
      end
      puts '*** *** ***'
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
