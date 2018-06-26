class CargoTrain < Train
  def initialize(number)
    super(number, 'Cargo')
  end

  def add_wagon(wagon)
    if wagon.kind_of?(CargoWagon)
      super
    end
  end
end
