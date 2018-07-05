require_relative 'manufacturer.rb'
require_relative 'classes_notifications.rb'
require_relative 'validation.rb'

class Wagon
  include ClassesNotifications
  include Manufacturer
  include Validation
  attr_reader :wagon_type, :place, :place_taken

  def initialize(wagon_type, place)
    @wagon_type = wagon_type
    @place = place
    @place_taken = 0
    validate!
  end

  def take(take_place, type)
    return no_places(type) if @place < 1 || @place < take_place
    if @place >= @place_taken
      @place -= take_place
      @place_taken += take_place
    end
  end

  def show
    @place
  end

  def show_taken
    @place_taken
  end

  protected

  def validate!
    raise invalid_type unless [:Cargo, :Passenger].include?(wagon_type)
    raise places_error if place < 0
  end
end
