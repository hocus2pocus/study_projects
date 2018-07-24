module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(attribute, validator, *arguments)
      @validation ||= []
      @validation << {attribute: attribute, validator: validator, arguments: arguments}
      p @validation
    end
  end

  module InstanceMethods
    def validate!
      self.class.instance_variable_get('@validation').each do |set|
        opted_validator = "#{set[:validator]}_validator"
        p opted_validator
        value = instance_variable_get("@#{set[:attribute]}".to_sym)
        p value
        send(opted_validator, value, *set[:arguments].first)
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    def format_validator(attribute, argument)
      raise "#{attribute} имеет неверный формат" unless attribute =~ argument
    end

    def presence_validator(attribute)
      raise "#{attribute} не может быть пустым" if attribute.nil? || attribute == ''
    end

    def type_validator(attribute, argument)
      #p attribute.class
      #p attribute
      #p argument
      raise "#{attribute} имеет неверный тип" unless attribute.is_a?(argument)
    end
  end
end
