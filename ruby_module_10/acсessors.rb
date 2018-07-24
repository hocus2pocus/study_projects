module Acсessors
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*attributes)
      attributes.each do |name|
        attribute_name = "@#{name}".to_sym
        attribute_history = "#{name}_history".to_sym

        define_method("#{name}_history") { instance_variable_get(attribute_history) }

        define_method(name) { instance_variable_get(attribute_name) }

        define_method("#{name}=".to_sym) do |value|
          history = instance_variable_get(attribute_history) || []
          history << value
          instance_variable_set(attribute_history, history)
          instance_variable_set(attribute_name, value)
        end
      end
    end

    def strong_attr_accessor(attribute, class_name)
      attribute_name = "@#{attribute}".to_sym

      define_method(attribute) { instance_variable_get(attribute_name) }

      define_method("#{attribute}=") do |value|
        raise "неверный тип значения" unless value.is_a?(class_name)
        instance_variable_set(attribute_name, value)
      end
    end
  end

  module InstanceMethods
  end
end
