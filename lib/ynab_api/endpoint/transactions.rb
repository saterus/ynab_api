module YnabApi
  module Endpoint
    class Transactions

      def initialize(budget_id)
        @budget_id = budget_id
        @connection = YnabApi::Connection.new
      end

      def get(account_id: nil, category_id: nil, since_date: nil, type: nil)
        url = determine_url(account_id, category_id)
        response = @connection.get(url) do |req|
          req.params['since_date'] = since_date if since_date
          req.params['type'] = type if type
        end
        response.body["data"]["transactions"].map do |transaction|
          Data::Transaction.new(transaction)
        end
      end

      private

      def determine_url(account_id, category_id)
        raise "pick one" if account_id && category_id
        if account_id
          "/v1/budgets/#{@budget_id}/accounts/#{account_id}"
        elsif category_id
          "/v1/budgets/#{@budget_id}/categories/#{category_id}"
        else
          "/v1/budgets/#{@budget_id}/transactions"
        end
      end

    end
  end
end
