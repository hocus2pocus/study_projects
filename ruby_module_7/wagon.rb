require_relative 'manufacturer.rb'
require_relative 'classes_support.rb'
require_relative 'validation.rb'

class Wagon
  include ClassesSupport
  include Manufacturer
  include Validation
  attr_reader :wagon_type

  def initialize(wagon_type)
    @wagon_type = wagon_type
    validate!
  end

  protected

  def validate!
    raise invalid_type unless [:Cargo, :Passenger].include?(wagon_type)
  end
end
