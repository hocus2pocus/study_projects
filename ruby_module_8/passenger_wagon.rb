class PassengerWagon < Wagon
  def initialize(seats)
    super(:Passenger, seats)
  end

  def take
    super(1)
  end

  # def validate!
  #   #raise places_error("мест") unless places.kind_of?(Integer)
  #   raise places_error("мест") if places < 0
  # end
end
