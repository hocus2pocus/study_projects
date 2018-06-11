class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def handle_train_arrival(train)
    @trains << train
  end

  def trains_by_type(type)
    @trains.select { |train| train.type == type }.count
  end

  def send_train(train)
    @trains.delete(train) if @trains.include?(train)
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
    return if station == @stations.first || station == @stations.last
    @stations.delete(station)
  end

  def show_stations
    stations.each { |station| station.name }
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
    @route.stations.first.handle_train_arrival(self)
    @current_station_index = 0
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def previous_station
    return if @route.stations[@current_station_index] == @route.stations.first
    @route.stations[@current_station_index - 1]
  end

  def next_station
    return if @route.stations[@current_station_index] == @route.stations.last
    @route.stations[@current_station_index + 1]
  end

  def backward
    if previous_station
      @route.stations[@current_station_index].send_train(self)
      previous_station.handle_train_arrival(self)
      @current_station_index -= 1
    end
  end

  def forward
    if next_station
      @route.stations[@current_station_index].send_train(self)
      next_station.handle_train_arrival(self)
      @current_station_index += 1
    end
  end

  def speed(value)
    return if value < 0
    @speed = value
  end
end
