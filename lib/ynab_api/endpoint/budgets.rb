module YnabApi
  module Endpoint
    class Budgets

      def initialize
        @connection = YnabApi::Connection.new
      end

      def get
        response = @connection.get("/v1/budgets")
        response.body["data"]["budgets"].map do |hsh|
          Data::Budget.new(hsh)
        end
      end

    end
  end
end
