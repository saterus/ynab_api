require 'bigdecimal'

module YnabApi
  module Data
    module Money

      # TODO: Replace this with a better money-specific type. float is wrong,
      # but this gets us the right order of magnitude and is human readable
      # (unlike BigDecimal itself).
      def self.from_api_value(raw_value)
        if raw_value
          # NOTE: The API values are 1/10cent accurate, not just an integer
          # number of cents.
          (BigDecimal.new(raw_value) / 1000).to_f
        else
          0.0
        end
      end

    end
  end
end
