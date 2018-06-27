require_relative 'manufacturer.rb'

class Wagon
  include Manufacturer
  attr_reader :wagon_type

  def initialize(wagon_type)
    @wagon_type = wagon_type
    register_instance
  end
end
