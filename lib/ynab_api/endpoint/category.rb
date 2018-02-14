module YnabApi
  module Endpoint
    class Category

      def initialize(budget_id, category_id)
        @budget_id = budget_id
        @category_id = category_id
        @connection = YnabApi::Connection.new
      end

      def get
        response = @connection.get("/v1/budgets/#{@budget_id}/categories/#{@category_id}")
        Data::Category.new(response.body["data"]["category"])
      end

    end
  end
end
