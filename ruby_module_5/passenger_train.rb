class PassengerTrain < Train
  def initialize(number)
    super(number, 'Passenger')
  end

  def add_wagon(wagon)
    if wagon.kind_of?(PassengerWagon)
      super
    end
  end
end
