class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains << train
  end

  def trains_by_type(type)
    @trains.count { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end
end

class Route
  attr_reader :stations

  def initialize(station_first, station_last)
    @stations = [station_first, station_last]
  end

  def add_station(station)
    @stations.insert(1, station)
  end

  def delete_station(station)
    @stations.delete(station) unless [@stations.first, @stations.last].include?(station)
  end

  def show_stations
    stations.each { |station| puts station.name }
  end
end

class Train
  attr_reader :speed, :type, :number_of_wagons, :route, :number

  def initialize(number, type, number_of_wagons)
    @number = number
    @number_of_wagons = number_of_wagons
    @type = type
    @speed = 0
  end

  def add_wagon
    @number_of_wagons += 1 if speed == 0
  end

  def remove_wagon
    @number_of_wagons -= 1 if speed == 0 && @number_of_wagons > 0
  end

  def set_route(route)
    @route = route
    @route.stations.first.take_train(self)
    @current_station_index = 0
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def previous_station
    return if current_station == @route.stations.first
    @route.stations[@current_station_index - 1]
  end

  def next_station
    return if current_station == @route.stations.last
    @route.stations[@current_station_index + 1]
  end

  def backward
    return unless previous_station
      current_station.send_train(self)
      previous_station.take_train(self)
      @current_station_index -= 1
  end

  def forward
    return unless next_station
      current_station.send_train(self)
      next_station.take_train(self)
      @current_station_index += 1
  end

  def speed_up(value)
    return if value < 0
    @speed += value
  end

  def speed_down(value)
    return if value < 0
    @speed -= value
    @speed = 0 if @speed < 0
  end
end
