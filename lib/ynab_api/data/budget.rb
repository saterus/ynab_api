module YnabApi
  module Data
    class Budget

      attr_reader :id, :name, :last_accessed_on, :date_format, :currency_format, :first_month, :last_month

      def initialize(response_hash)
        @id = response_hash["id"]
        @name = response_hash["name"]
        @last_accessed_on = response_hash["last_accessed_on"]
        @date_format = response_hash["date_format"]
        @currency_format = response_hash["currency_format"]
        @first_month = response_hash["first_month"]
        @last_month = response_hash["last_month"]
        @month_details = {}
      end

      def accounts(reload: false)
        @accounts = nil if reload
        @accounts ||= Endpoint::Accounts.new(id).get
      end

      def category_groups(reload: false)
        @category_groups = nil if reload
        @category_groups ||= Endpoint::CategoryGroup.new(id).get
      end

      def months(reload: false)
        @months = nil if reload
        @months ||= Endpoint::Months.new(id).get
      end

      def month(month, reload: false)
        @month_details.delete(month) if reload
        @month_details[month] ||= Endpoint::Month.new(id, month).get
      end

      def transactions(reload: false, **opts)
        @transactions = nil if reload
        @transactions ||= Endpoint::Transactions.new(id).get(**opts)
      end

    end
  end
end
