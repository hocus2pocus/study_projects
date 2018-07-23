module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(attribute, validator, *arguments)
      @validation ||= []
      @validation << {attribute: attribute, validator: validator, arguments: arguments}
    end
  end

  module InstanceMethods
    def validate!
      self.class.instance_variable_get('@validation').each do |set|
        send("#{set[:validator]}_validator".to_sym, set[:attribute], set[:arguments].first)
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
      p attribute.class
      p argument
      raise "#{attribute} имеет неверный тип" unless attribute.is_a?(argument)
    end
  end
end
