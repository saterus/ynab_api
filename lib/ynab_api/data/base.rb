module YnabApi
  module Data
    class Transformations

      def self.money(value)
        Money.from_api_value(value)
      end

      def self.date(value)
        if value && !value.empty?
          Date.parse(value)
        end
      end

      COERCE = ->(klass, value) { klass.new(value) }
      def self.coerce(klass)
        COERCE.curry(2)[klass]
      end

    end

    class Field

      IDENTITY_TRANSFORM = ->(v) { v }

      attr_reader :name, :transform

      def initialize(name, transform = nil)
        @name = name.to_s
        @transform = transform || IDENTITY_TRANSFORM
      end

      def extract_field_value(hash)
        transform.call(hash[name])
      end

    end

    class ArrayField < Field

      def extract_field_value(hash)
        Array(hash[name]).map do |value|
          transform.call(value)
        end
      end

    end

    class Base

      def self.field(name, opts = {})
        attr_reader name
        @fields ||= []
        if opts[:multi]
          @fields << ArrayField.new(name, lookup_transform(opts[:transform]))
        else
          @fields << Field.new(name, lookup_transform(opts[:transform]))
        end
      end

      def self.fields
        @fields
      end

      def self.transforms
        @transforms ||= {
          "money" => Transformations.method(:money),
          "date" => Transformations.method(:date),
        }
      end

      def self.lookup_transform(name)
        case name
        when NilClass then nil
        when Proc then name
        when Class then Transformations.coerce(name)
        when Symbol then transforms[name.to_s]
        when String then transforms[name]
        else
          raise "unknown transform `#{name}`"
        end
      end

      def initialize(response_hash)
        self.class.fields.each do |field|
          value = field.extract_field_value(response_hash)
          instance_variable_set("@#{field.name}", value)
        end
      end

    end
  end
end
