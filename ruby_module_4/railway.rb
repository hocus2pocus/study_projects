# Класс Station (Станция):
class Station
  attr_reader :trains, :name

# Имеет название, которое указывается при ее создании
  def initialize(name)
    @name = name
    @trains = []
  end

# Может принимать поезда (по одному за раз)
#Vlad Filiucov: дальше, там в take_the_train (это именно тот метод, который в моем примере назывался handle_train_arrival) используй @trains < train
#Это лучше, чем обращаться к сеттеру
#Почему не стоит обращаться к сеттеру?
  def handle_train_arrival(train)
    @trains << train
  end

# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# attr_reader :trains

# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# train.type == type - переименовал аргумент
  def trains_by_type(which_type)
    @trains.select { |train| train.type == which_type }.count
  end

# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
  def send_the_train(train)
    @trains.delete(train) if @trains.include?(train)
  end
end

# Класс Route (Маршрут):
class Route
  attr_reader :stations

# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
  def initialize(station_first, station_last)
    @stations = [station_first, station_last]
  end

# Может добавлять промежуточную станцию в список
  def add_station(station)
    @stations.insert(1, station)
  end

# Может удалять промежуточную станцию из списка
  def delete_station(station)
    @stations.delete(station)
  end

# Может выводить список всех станций по-порядку от начальной до конечной
# attr_reader :stations
  def show_stations
    stations.each { |station| station.name }
  end
end

# Класс Train (Поезд):
class Train
  attr_accessor :speed, :type, :number_of_wagons, :route

# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
  def initialize(train_number, type, number_of_wagons)
    @train_number = train_number
    @number_of_wagons = number_of_wagons
    # until train_type == "cargo" || train_type == "passenger"
    #   print "Wrong wagon type. Specify the type: "
    #   train_type = gets.chomp
    # end
    @type = type
    @speed = 0
  end

# Может набирать скорость
# attr_accessor :speed

# Может возвращать текущую скорость
# attr_accessor :speed

# Может тормозить (сбрасывать скорость до нуля)
# attr_accessor :speed

# Может возвращать количество вагонов
# attr_accessor :number_of_wagons

# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
  def add_wagon
    @number_of_wagons += 1 if @speed == 0
    # else
    #   puts "Stop first."
    # end
  end

  def remove_wagon
   @number_of_wagons -= 1 if @speed == 0
    # else
    #   puts "Stop first."
    # end
  end

# Может принимать маршрут следования (объект класса Route).
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута

  def set_route(route)
    @route = route
    @route.stations.first.handle_train_arrival(self)
    @current_station_index = 0
    # @train_route = route.stations
    # @train_station = @train_route[0]#route.route[0]
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def previous_station
    @route.stations[@current_station_index - 1] unless @route.stations[@current_station_index] == @route.stations.first
  end

  def next_station
    @route.stations[@current_station_index + 1] unless @route.stations[@current_station_index] == @route.stations.last
  end

  def backward
    @route.stations[@current_station_index].send_the_train(self)
    unless @route.stations[@current_station_index] == @route.stations.first
      self.previous_station.handle_train_arrival(self)
      @current_station_index -= 1
    end
  end

  def forward
    @route.stations[@current_station_index].send_the_train(self)
    unless @route.stations[@current_station_index] == @route.stations.last
      self.next_station.handle_train_arrival(self)
      @current_station_index += 1
    end
  end
end
