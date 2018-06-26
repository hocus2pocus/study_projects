require_relative 'instance_counter.rb'

class Wagon
  include InstanceCounter
  include Manufacturer
  attr_reader :wagon_type

  def initialize(wagon_type)
    @wagon_type = wagon_type
    register_instance
  end
end
