class CargoTrain < Train
  attr_reader :type

  def initialize(number)
    @number = number
    @type = 'Cargo'
    super(number)
  end
end
