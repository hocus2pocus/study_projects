require_relative 'interface_support.rb'
require_relative 'interface_station.rb'
require_relative 'interface_route.rb'
require_relative 'interface_train.rb'
require_relative 'interface_wagon.rb'

class Interface
  include InterfaceSupport
  include InterfaceStation
  include InterfaceRoute
  include InterfaceTrain
  include InterfaceWagon

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
    when 3
      all_stations_info
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
      use_wagon
      train_menu
    when 7
      train_forward
      train_menu
    when 8
      train_backward
      train_menu
    when 0
      start_menu
    when 9
      all_trains_info
      train_menu
    else
      error_message
      train_menu
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

  def set_places
    set_places_message
    gets.to_i
  end

  def set_volume
    set_volume_message
    gets.to_i
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

    @trains << CargoTrain.new('11111')
    @trains << CargoTrain.new('22222')
    @trains << PassengerTrain.new('88888')
    @trains << PassengerTrain.new('99999')
  end
end
