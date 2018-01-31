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
        response.body["data"]["category"].map do |hsh|
          Data::Category.new(hsh)
        end
      end

    end
  end
end
