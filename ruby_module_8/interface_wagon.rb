module InterfaceWagon
  def use_wagon
    trains_check
    train = choose_train
    return no_wagons_error if train.wagons.empty?

    wagons_list(train)
    remove_wagon_input
    wagon = train.wagons[gets.to_i - 1]

    case
    when wagon.kind_of?(PassengerWagon)
      wagon_space_error unless wagon.take
    when wagon.kind_of?(CargoWagon)
      take_volume
      wagon_space_error unless wagon.take(gets.to_i)
    end
  end

  def create_wagon(train)
    case
    when train.kind_of?(CargoTrain)
      volume = set_volume
      CargoWagon.new(volume)
    when train.kind_of?(PassengerTrain)
      places = set_places
      PassengerWagon.new(places)
    end
     rescue
       retry
  end
end
