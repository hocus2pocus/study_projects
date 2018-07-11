module InterfaceWagon
  def use_wagon
    trains_check
    train = choose_train
    return no_wagons_error if train.wagons.empty?

    wagons_list(train)
    remove_wagon_input
    wagon = train.wagons[gets.to_i - 1]

    load_wagon(wagon)
  end

  def load_wagon(wagon)
    if wagon.is_a?(CargoWagon)
      take_volume
      wagon_space_error unless wagon.take(gets.to_i)
    elsif wagon.is_a?(PassengerWagon)
      wagon_space_error unless wagon.take
    end
  end

  def create_wagon(train)
    if train.is_a?(CargoTrain)
      volume = set_volume
      CargoWagon.new(volume)
    elsif train.is_a?(PassengerTrain)
      places = set_places
      PassengerWagon.new(places)
    end
  rescue StandardError
    retry
  end
end
