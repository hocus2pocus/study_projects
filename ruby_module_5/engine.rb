class Engine
  private

  @stations_list = []
  @routes_list = []
  @trains_list = []

  def self.create_station
    puts 'введите название станции'
    print '> '
    @stations_list << Station.new(gets.chomp)
  end

  def self.trains_on_station
    stations_list

    puts 'введите номер станции'
    print '> '
    station = @stations_list[gets.to_i - 1]

    station.show_trains
  end

  def self.create_route
    stations_list

    puts 'введите номер начальной станции'
    print '> '
    first_station = @stations_list[gets.to_i - 1]

    puts 'введите номер конечной станции'
    print '> '
    last_station = @stations_list[gets.to_i - 1]

    @routes_list << Route.new(first_station,last_station)
  end

  def self.add_station
    routes_list

    puts 'введите номер маршрута'
    print '> '
    route_work = @routes_list[gets.to_i - 1]

    stations_list

    puts 'введите номер станции'
    print '> '
    station_work = @stations_list[gets.to_i - 1]

    route_work.add_station(station_work)
  end

  def self.delete_station
    routes_list

    puts 'введите номер маршрута'
    print '> '
    route_work = @routes_list[gets.to_i - 1]

    route_work.show_stations
    puts 'введите номер станции'
    print '> '
    station_work = route_work.show_stations[gets.to_i - 1]

    route_work.delete_station(station_work)
  end

  def self.route_stations
    routes_list

    puts 'введите номер маршрута'
    print '> '
    route_work = @routes_list[gets.to_i - 1]

    route_work.show_stations
    puts ' '
  end

  def self.create_train
    puts 'укажите номер поезда'
    print '> '
    number = gets.to_i

    puts 'укажите тип поезда'
    puts '1 - грузовой, 2 - пассажирский'
    print '> '
    type = gets.to_i

    case type
      when 1
        @trains_list << CargoTrain.new(number)
      when 2
        @trains_list << PassengerTrain.new(number)
    end
  end

  def self.set_route
    trains_list
    train_work

    routes_list
    route_work

    @chosen_train.set_route(@chosen_route)
  end

  def self.add_wagon
    trains_list
    train_work

    case @chosen_train.type
      when 'Cargo'
        wagon = CargoWagon.new
      when 'Passenger'
        wagon = PassengerWagon.new
    end

    @chosen_train.add_wagon(wagon)
  end

  def self.remove_wagon
    trains_list
    train_work

    return if @chosen_train.number_of_wagons.empty?

    @chosen_train.number_of_wagons.each.with_index(1) do |wagon, index|
      puts "#{index} - #{wagon.wagon_type}"
    end

    puts 'укажите вагон к удалению'
    print '> '
    chosen_wagon = @chosen_train.number_of_wagons[gets.to_i - 1]

    @chosen_train.remove_wagon(chosen_wagon)
  end

  def self.train_forward
    trains_list
    train_work

    @chosen_train.forward
  end

  def self.train_backward
    trains_list
    train_work

    @chosen_train.backward
  end

  def self.stations_list
    @stations_list.each.with_index(1) do |station, index|
      puts "#{index} - #{station.name}"
    end
  end

  def self.routes_list
    @routes_list.each.with_index(1) do |route, index|
      puts "#{index} - начальная станция #{route.stations.first.name}, конечная станция #{route.stations.last.name}."
    end
  end

  def self.trains_list
    @trains_list.each.with_index(1) do |train, index|
      puts "#{index} - #{train.type} - #{train.number}"
    end
  end

  def self.route_work
    puts 'введите номер маршрута'
    print '> '
    @chosen_route = @routes_list[gets.to_i - 1]
  end

  def self.train_work
    puts 'введите порядковый номер поезда'
    print '> '
    @chosen_train = @trains_list[gets.to_i - 1]
  end


  def self.seed
    @stations_list << Station.new('Krasnodar')
    @stations_list << Station.new('Azeroth')
    @stations_list << Station.new('Narnia')
    @stations_list << Station.new('Valhalla')
    @stations_list << Station.new('Mordor')
    @stations_list << Station.new('Shire')

    @routes_list << Route.new(@stations_list[0],@stations_list[1])
    @routes_list << Route.new(@stations_list[0],@stations_list[2])
    @routes_list << Route.new(@stations_list[0],@stations_list[3])

    @trains_list << CargoTrain.new(111)
    @trains_list << CargoTrain.new(222)
    @trains_list << PassengerTrain.new(888)
    @trains_list << PassengerTrain.new(999)
  end

end
