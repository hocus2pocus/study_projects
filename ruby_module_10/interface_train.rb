module InterfaceTrain
  def create_cargo_train
    train_id_input
    number = gets.to_s
    @trains << CargoTrain.new(number)
    successful_creation_train(number, 'Грузовой Поезд')
  rescue StandardError
    retry
  end

  def create_passenger_train
    train_id_input
    number = gets.to_s
    @trains << PassengerTrain.new(number)
    successful_creation_train(number, 'Пассажирский Поезд')
  rescue StandardError
    retry
  end

  def establish_route
    trains_check
    routes_check
    train = choose_train
    route = choose_route
    train.establish_route(route)
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
    removing_wagon(wagon, train)
  end

  def removing_wagon(wagon, train)
    if train.wagons.include?(wagon)
      train.remove_wagon(wagon)
      @wagons << wagon
    else
      error_message
      remove_wagon
    end
  end

  def cargo_trains_info_output
    wagon_id = 0
    #cargo_block =
    proc { |wagon|
      puts %(Вагон № #{wagon_id += 1} - тип #{wagon.wagon_type})
      puts %(свободный объём #{wagon.free_space} - занятый объём #{wagon.taken_space})
    }
  end

  def passenger_trains_info_output
    wagon_id = 0
    passenger_block = proc { |wagon|
      puts %(Вагон № #{wagon_id += 1} - тип #{wagon.wagon_type})
      puts %(свободно мест #{wagon.free_space} - занято мест #{wagon.taken_space})
    }
  end

  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def all_trains_info
    return if @trains.empty?

    @trains.each do |train|
      puts '*** *** ***'
      train_info(train.number, train.type)
      if train.wagons.any?
        search_trains_info(train)
      else
        no_wagons_error
      end
      puts '*** *** ***'
      wagon_id = 0
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  def search_trains_info(train)
    if train.is_a?(CargoTrain)
      train.each_wagon(&cargo_trains_info_output)
    elsif train.is_a?(PassengerTrain)
      train.each_wagon(&passenger_trains_info_output)
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
