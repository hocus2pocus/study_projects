require_relative 'interface_support.rb'

class Interface
  include InterfaceSupport

  def initialize
    @stations = []
    @routes = []
    @trains = []
    #отцепленные вагоны
    @wagons = []
  end

  def start_menu
    case first_question_pack
    when 1
      station_menu
    when 2
      route_menu
    when 3
      train_menu
    when 9
      seed
      start_menu
    when 0
      exit
    # when 99
    #   p @wagons
    else
      error_message
      start_menu
    end
  end

private

  def station_menu
    case station_question_pack
    when 1
      create_station
      station_menu
    when 2
      trains_on_station
      station_menu
    when 0
      start_menu
    else
      error_message
      station_menu
    end
  end

  def route_menu
    case route_question_pack
    when 1
      create_route
      route_menu
    when 2
      add_station
      route_menu
    when 3
      delete_station
      route_menu
    when 4
      route_stations
      route_menu
    when 0
      start_menu
    else
      error_message
      route_menu
    end
  end

  def train_menu
    case train_question_pack
    when 1
      create_cargo_train
      train_menu
    when 2
      create_passenger_train
      train_menu
    when 3
      set_route
      train_menu
    when 4
      add_wagon
      train_menu
    when 5
      remove_wagon
      train_menu
    when 6
      train_forward
      train_menu
    when 7
      train_backward
      train_menu
    when 0
      start_menu
    else
      error_message
      train_menu
    end
  end

  def create_station
    station_name_input
    @stations << Station.new(gets.chomp)
  end

  def trains_on_station
    stations_check
    station = choose_station
    station.show_trains
  end

  def create_route
    stations_check
    stations_list
    first_station_number_input
    first_station = @stations[gets.to_i - 1]

    last_station_number_input
    last_station = @stations[gets.to_i - 1]

    @routes << Route.new(first_station,last_station)
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

  def create_cargo_train
    train_id_input
    number = gets.to_i
    @trains << CargoTrain.new(number)
  end

  def create_passenger_train
    train_id_input
    number = gets.to_i
    @trains << PassengerTrain.new(number)
  end

  def set_route
    trains_check
    routes_check
    train = choose_train
    route = choose_route
    train.set_route(route)
  end

  def add_wagon
    trains_check
    train = choose_train
    wagon = create_wagon(train)
    train.add_wagon(wagon)
  end

  def remove_wagon
    trains_check
    train = choose_train
    return no_wagons_error if train.wagons.empty?

    wagons_list(train)
    remove_wagon_input
    wagon = train.wagons[gets.to_i - 1]
    if train.wagons.include?(wagon)
      train.remove_wagon(wagon)
      @wagons << wagon
    else
      error_message
      remove_wagon
    end
  end

  def train_forward
    trains_check
    train = choose_train
    train.forward
  end

  def train_backward
    trains_check
    train = choose_train
    train.backward
  end

  def create_wagon(train)
    case
    when train.kind_of?(CargoTrain)
      CargoWagon.new
    when train.kind_of?(PassengerTrain)
      PassengerWagon.new
    end
  end

  def stations_list
    @stations.each.with_index(1) do |station, index|
      puts "#{index} - #{station.name}"
    end
  end

  def routes_list
    @routes.each.with_index(1) do |route, index|
      puts "#{index} - начальная станция #{route.stations.first.name}, конечная станция #{route.stations.last.name}."
    end
  end

  def trains_list
    @trains.each.with_index(1) do |train, index|
      puts "#{index} - #{train.type} - #{train.number}"
    end
  end

  def wagons_list(train)
    train.wagons.each.with_index(1) do |wagon, index|
      puts "#{index} - #{wagon.wagon_type}"
    end
  end

  def get_station_from_user
    station_number_input
    gets.to_i - 1
  end

  def choose_station
    stations_list
    station = get_station_from_user
    if @stations[station]
      @stations[station]
    else
      error_message
      choose_station
    end
  end

  def get_route_from_user
    route_number_input
    gets.to_i - 1
  end

  def choose_route
    routes_list
    route = get_route_from_user
    if @routes[route]
      @routes[route]
    else
      error_message
      choose_route
    end
  end

  def get_train_from_user
    train_number_input
    gets.to_i - 1
  end

  def choose_train
    trains_list
    train = get_train_from_user
    if @trains[train]
      @trains[train]
    else
      error_message
      choose_train
    end
  end

  def stations_check
    if @stations.empty?
      error_message
      start_menu
    end
  end

  def routes_check
    if @routes.empty?
      error_message
      start_menu
    end
  end

  def trains_check
    if @trains.empty?
      error_message
      start_menu
    end
  end

  def seed
    @stations << Station.new('Krasnodar')
    @stations << Station.new('Azeroth')
    @stations << Station.new('Narnia')
    @stations << Station.new('Valhalla')
    @stations << Station.new('Mordor')
    @stations << Station.new('Shire')

    @routes << Route.new(@stations[0],@stations[1])
    @routes << Route.new(@stations[0],@stations[2])
    @routes << Route.new(@stations[0],@stations[3])

    @trains << CargoTrain.new(111)
    @trains << CargoTrain.new(222)
    @trains << PassengerTrain.new(888)
    @trains << PassengerTrain.new(999)
  end
end
