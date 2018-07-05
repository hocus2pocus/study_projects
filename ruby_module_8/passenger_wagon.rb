require_relative 'classes_notifications.rb'

class PassengerWagon < Wagon
  include ClassesNotifications

  def initialize(seats)
    super(:Passenger, seats)
  end

  def take
    super(1, "мест")
  end

  # def validate!
  #   #raise places_error("мест") unless places.kind_of?(Integer)
  #   raise places_error("мест") if places < 0
  # end
end
