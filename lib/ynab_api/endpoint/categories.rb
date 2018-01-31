module YnabApi
  module Endpoint
    class Categories

      def initialize(budget_id)
        @budget_id = budget_id
        @connection = YnabApi::Connection.new
      end

      def get
        response = @connection.get("/v1/budgets/#{@budget_id}/categories")
        response.body["data"]["category_groups"].map do |hsh|
          Data::CategoryGroup.new(hsh)
        end
      end

    end
  end
end
