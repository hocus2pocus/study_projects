class PassengerTrain < Train
  validate :number, :presence
  validate :number, :format, NUMBER

  def initialize(number)
    super(number, :Passenger)
  end

  def add_wagon(wagon)
    super if wagon.is_a?(PassengerWagon)
  end
end
