class CargoWagon < Wagon
  def initialize(volume)
    super(:Cargo, volume)
  end

  # def take(take_volume)
  #   super(take_volume)
  # end

  # def validate!
  #   #raise places_error("объём") unless volume.kind_of?(Integer)
  #   raise places_error("объём") if volume < 0
  # end
end
