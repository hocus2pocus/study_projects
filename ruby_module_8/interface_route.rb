module InterfaceRoute
  def create_route
    stations_check
    stations_list
    first_station_number_input
    first_station = @stations[gets.to_i - 1]

    last_station_number_input
    last_station = @stations[gets.to_i - 1]

    @routes << Route.new(first_station, last_station)
    successful_creation_route(first_station.name, last_station.name)

    rescue
      retry
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
