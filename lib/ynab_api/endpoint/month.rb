module YnabApi
  module Endpoint
    class Month

      def initialize(budget_id, month)
        @budget_id = budget_id
        @month = month
        @connection = YnabApi::Connection.new
      end

      def get
        response = @connection.get("/v1/budgets/#{@budget_id}/months/#{@month}")
        Data::Month.new(response.body["data"]["month"])
      end

    end
  end
end
