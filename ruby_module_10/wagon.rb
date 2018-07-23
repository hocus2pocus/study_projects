require_relative 'manufacturer.rb'
require_relative 'classes_notifications.rb'
require_relative 'validation.rb'
require_relative 'acсessors.rb'

class Wagon
  include ClassesNotifications
  include Manufacturer
  include Validation
  include Acсessors

  attr_reader :wagon_type, :available_space, :taken_space

  def initialize(wagon_type, available_space)
    @wagon_type = wagon_type
    @available_space = available_space
    @taken_space = 0
    validate!
  end

  def take(take_space)
    return if free_space < take_space
    @taken_space += take_space
  end

  def free_space
    @available_space - @taken_space
  end

  # protected

  # def validate!
  #   raise invalid_type unless %i[Cargo Passenger].include?(wagon_type)
  #   raise places_error if available_space < 0
  # end
end
