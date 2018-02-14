module YnabApi
  module Endpoint
    class Transactions
      TransactionPayload = Struct.new(
        :id, :account_id, :date, :amount, :payee_id, :payee_name, :category_id, :memo,
        :cleared, :approved, :flag_color
      )

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

      def post(transaction_payload)
        response = @connection.post("/v1/budgets/#{@budget_id}/transactions", transaction: transaction_payload.to_h)
        Data::Transaction.new(response.body["data"]["transaction"])
      end

      def build_transaction
        TransactionPayload.new
      end

      def put(transaction_payload)
        response = @connection.put("/v1/budgets/#{@budget_id}/transactions/#{transaction_payload.id}", transaction: transaction_payload.to_h)
        Data::Transaction.new(response.body["data"]["transaction"])
      end

      def payload_from_transaction(transaction)
        TransactionPayload.new.tap do |p|
          p.id = transaction.id
          p.account_id = transaction.account_id
          p.date = transaction.date
          p.amount = transaction.amount
          p.payee_id = transaction.payee_id
          p.category_id = transaction.category_id
          p.memo = transaction.memo
          p.cleared = transaction.cleared
          p.approved = transaction.approved
          p.flag_color = transaction.flag_color
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
