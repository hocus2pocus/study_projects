class PassengerTrain < Train
  attr_reader :type

  def initialize(number)
    @number = number
    @type = 'Passenger'
    super(number)
  end
end
