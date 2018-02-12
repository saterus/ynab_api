module YnabApi
  module Data
    class Account

      attr_reader :id, :name, :type, :on_budget, :closed, :note, :balance

      def initialize(response_hash)
        @id = response_hash["id"]
        @name = response_hash["name"]
        @type = response_hash["type"]
        @on_budget = response_hash["on_budget"]
        @closed = response_hash["closed"]
        @note = response_hash["note"]
        @balance = Money.from_api_value(response_hash["balance"])
      end

    end
  end
end
