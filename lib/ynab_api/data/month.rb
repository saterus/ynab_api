module YnabApi
  module Data
    class Month

      attr_reader :month, :note, :to_be_budgeted, :age_of_money, :categories

      def initialize(response_hash)
        @month = response_hash["month"]
        @note = response_hash["note"]
        @to_be_budgeted = Money.from_api_value(response_hash["to_be_budgeted"])
        @age_of_money = response_hash["age_of_money"]
        @categories = Array(response_hash["categories"]).map do |h|
          Data::Category.new(h)
        end
      end

    end
  end
end
