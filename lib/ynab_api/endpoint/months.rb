module YnabApi
  module Endpoint
    class Months

      def initialize(budget_id)
        @budget_id = budget_id
        @connection = YnabApi::Connection.new
      end

      def get
        response = @connection.get("/v1/budgets/#{@budget_id}/months")
        response.body["data"]["months"].map do |hsh|
          Data::Month.new(hsh)
        end
      end

    end
  end
end
