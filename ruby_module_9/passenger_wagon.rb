class PassengerWagon < Wagon
  def initialize(seats)
    super(:Passenger, seats)
  end

  def take
    super(1)
  end
end
