require_relative 'manufacturer.rb'
require_relative 'interface_support.rb'
require_relative 'validation.rb'

class Wagon
  include InterfaceSupport
  include Manufacturer
  include Validation
  attr_reader :wagon_type

  def initialize(wagon_type)
    @wagon_type = wagon_type
    validate!
  end

  protected

  def validate!
    raise invalid_type unless wagon_type == :Cargo || :Passenger
    successful_creation
    true
  end
end
