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
      end

      def accounts(reload = false)
        @accounts = nil if reload
        @accounts ||= Endpoint::Accounts.new(id).get
      end

    end
  end
end
