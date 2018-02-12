module YnabApi
  module Endpoint
    class Transaction

      def initialize(budget_id, transaction_id)
        @budget_id = budget_id
        @transaction_id = transaction_id
        @connection = YnabApi::Connection.new
      end

      def get
        response = @connection.get("/v1/budgets/#{@budget_id}/transactions/#{@transaction_id}")
        Data::Transaction.new(response.body["data"]["transaction"])
      end

    end
  end
end
