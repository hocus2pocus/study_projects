class Train
  attr_reader :speed, :type, :number_of_wagons, :route, :number

  def initialize(number)
    @number = number
    @number_of_wagons = []
    @speed = 0
  end

  # def add_wagon
  #   @number_of_wagons += 1 if speed == 0
  # end

  # def remove_wagon
  #   @number_of_wagons -= 1 if speed == 0 && @number_of_wagons > 0
  # end

  def add_wagon(wagon)
    if speed == 0
      @number_of_wagons << wagon
    else
      puts 'поезд необходимо остановить'
    end
  end

  def remove_wagon(wagon)
    puts 'поезд необходимо остановить либо у поезда нет вагонов' unless speed == 0 #&& @number_of_wagons > 0

    if @number_of_wagons.include?(wagon)
      @number_of_wagons.delete(wagon)
    else
      puts 'такого вагона нет'
    end
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
