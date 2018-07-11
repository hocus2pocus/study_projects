module InterfaceRoute
  def create_route
    first_station = take_stations('начальной')
    last_station = take_stations('конечной')

    @routes << Route.new(first_station, last_station)
    successful_creation_route(first_station.name, last_station.name)
  rescue StandardError
    retry
  end

  def take_stations(station)
    stations_check
    stations_list
    station_number_input_with_arg(station)
    @stations[gets.to_i - 1]
  end

  def add_station
    routes_check
    route = choose_route
    station = choose_station
    route.add_station(station)
  end

  def delete_station
    routes_check
    route = choose_route
    route.show_stations
    station_number_input
    station = route.show_stations[gets.to_i - 1]
    route.delete_station(station)
  end

  def route_stations
    routes_check
    route = choose_route
    route.show_stations
  end
end
