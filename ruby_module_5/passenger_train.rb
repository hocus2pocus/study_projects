class PassengerTrain < Train
  def initialize(number)
    type = 'Passenger'
    super(number, type)
  end

  def add_wagon
    wagon = PassengerWagon.new
    super(wagon)
  end
end
