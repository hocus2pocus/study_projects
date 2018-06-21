require_relative 'interface_support.rb'

class Interface
  include InterfaceSupport

  def initialize
    @stations = []
    @routes = []
    @trains = []
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
    end
  end

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
    end
  end

  def create_station
    station_name_input
    @stations << Station.new(gets.chomp)
  end

  def trains_on_station
    station = station_check
    station.show_trains
  end

  def create_route
    stations_list
    first_station_number_input
    first_station = @stations[gets.to_i - 1]

    last_station_number_input
    last_station = @stations[gets.to_i - 1]

    @routes << Route.new(first_station,last_station)
  end

  def add_station
    route = route_check
    station = station_check
    route.add_station(station)
  end

  def delete_station
    route = route_check
    route.show_stations
    station_number_input
    station = route.show_stations[gets.to_i - 1]
    route.delete_station(station)
  end

  def route_stations
    route = route_check
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
    train = train_check
    route = route_check
    train.set_route(route)
  end

  def add_wagon
    train = train_check
    train.add_wagon
  end

  def remove_wagon
    train = train_check
    train.remove_wagon
  end

  def train_forward
    train = train_check
    train.forward
  end

  def train_backward
    train = train_check
    train.backward
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

  def get_station_from_user
    puts 'введите номер станции'
    print '> '
    input = gets.to_i - 1
  end

  def station_check
    stations_list
    station = get_station_from_user
    if @stations[station]
      @stations[station]
    else
      error_message
    end
  end

  def get_route_from_user
    puts 'введите номер маршрута'
    print '> '
    input = gets.to_i - 1
  end

  def route_check
    routes_list
    route = get_route_from_user
    if @routes[route]
      @routes[route]
    else
      error_message
    end
  end

  def get_train_from_user
    puts 'введите порядковый номер поезда'
    print '> '
    input = gets.to_i - 1
  end

  def train_check
    trains_list
    train = get_train_from_user
    if @trains[train]
      @trains[train]
    else
      error_message
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
