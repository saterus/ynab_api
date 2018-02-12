module YnabApi
  module Data
    class Subtransaction < Base

      field :id
      field :transaction_id
      field :amount, transform: :money
      field :memo
      field :payee_id
      field :category_id
      field :transfer_account_id

    end
  end
end
