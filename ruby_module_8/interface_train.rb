module InterfaceTrain
  def create_cargo_train
    train_id_input
    number = gets.to_s
    @trains << CargoTrain.new(number)
    successful_creation_train(number, 'Грузовой Поезд')
    rescue
      retry
  end

  def create_passenger_train
    train_id_input
    number = gets.to_s
    @trains << PassengerTrain.new(number)
    successful_creation_train(number, 'Пассажирский Поезд')
    rescue
      retry
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
    successful_creation_wagon(wagon.wagon_type)
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

  def all_trains_info
    return if @trains.empty?
    wagon_id = 0
    cargo_block = Proc.new { |wagon| puts "Вагон № #{wagon_id += 1} - тип #{wagon.wagon_type} - свободный объём #{wagon.available_space} - занятый объём #{wagon.taken_space}" }
    passenger_block = Proc.new { |wagon| puts "Вагон № #{wagon_id += 1} - тип #{wagon.wagon_type} - свободно мест #{wagon.available_space} - занято мест #{wagon.taken_space}" }

    @trains.each do |train|
      puts '*** *** ***'
      train_info(train.number, train.type)
      if !train.wagons.empty?
        case
        when train.kind_of?(CargoTrain)
          train.each_wagon(&cargo_block)
        when train.kind_of?(PassengerTrain)
          train.each_wagon(&passenger_block)
        end
      else
        no_wagons_error
      end
      puts '*** *** ***'
      wagon_id = 0
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
end
