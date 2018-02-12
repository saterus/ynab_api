module YnabApi
  module Data
    class Category

      attr_reader :id, :category_group, :category_group_id, :name, :hidden, :note, :budgeted, :activity, :balance

      def initialize(response_hash, category_group: nil)
        @category_group = category_group

        @id = response_hash["id"]
        @category_group_id = response_hash["category_group_id"]
        @name = response_hash["name"]
        @hidden = response_hash["hidden"]
        @note = response_hash["note"]
        @budgeted = Money.from_api_value(response_hash["budgeted"])
        @activity = Money.from_api_value(response_hash["activity"])
        @balance = Money.from_api_value(response_hash["balance"])
      end

    end
  end
end

