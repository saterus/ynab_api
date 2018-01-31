module YnabApi
  module Endpoint
    class Accounts

      def initialize(budget_id)
        @budget_id = budget_id
        @connection = YnabApi::Connection.new
      end

      def get
        response = @connection.get("/v1/budgets/#{@budget_id}/accounts")
        response.body["data"]["accounts"].map do |hsh|
          Data::Account.new(hsh)
        end
      end
    end
  end
end
