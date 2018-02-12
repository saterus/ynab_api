module YnabApi
  module Data
    class Transaction < Base

      field :id
      field :date
      field :amount, transform: :money
      field :memo
      field :cleared
      field :approved
      field :flag_color
      field :account_id
      field :payee_id
      field :category_id
      field :transfer_account_id
      field :subtransactions, multi: true, transform: Data::Subtransaction

    end
  end
end
