class CargoTrain < Train
  validate :number, :presence
  validate :number, :format, NUMBER

  def initialize(number)
    super(number, :Cargo)
  end

  def add_wagon(wagon)
    super if wagon.is_a?(CargoWagon)
  end
end
