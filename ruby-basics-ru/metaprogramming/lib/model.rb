# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.extend(ClassMethods)
  end

  def initialize(attrs = {})
    @attrs = self.class.fields.map do |field|
      value = attrs.fetch field[:name], field[:default]
      prepared_value = to_type value, field[:type]
      [field[:name], prepared_value]
    end.to_h
  end

  def attributes
    @attrs
  end

  private

  def to_type(value, type)
    return value if type.nil? || value.nil?
    mapping = {
      integer: lambda { |value| Integer(value) },
      string: lambda { |value| String(value) },
      datetime: lambda { |value| DateTime.parse(value) },
      boolean: lambda{ |value| !!value }
    }
    mapping[type].(value)
  end

  module ClassMethods
    attr_reader :fields

    def attribute(name, type: nil, default: nil)
      @fields ||= []
      @fields.push name: name, type: type, default: default

      define_method name do
        @attrs[name]
      end

      define_method "#{name}=" do |value|
        @attrs[name] = to_type value, type
      end
    end
  end
end
# END
