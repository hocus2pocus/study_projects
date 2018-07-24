class CargoTrain < Train
  include Validation

  NUMBER = /^([0-9]|[a-z]){3}-?([0-9]|[a-z]){2}$/i

  validate :number, :presence
  validate :number, :format, NUMBER

  def initialize(number)
    super(number, :Cargo)
  end

  def add_wagon(wagon)
    super if wagon.is_a?(CargoWagon)
  end
end
