class CargoTrain < Train
  def initialize(number)
    type = 'Cargo'
    super(number, type)
  end

  def add_wagon
    wagon = CargoWagon.new
    super(wagon)
  end
end
