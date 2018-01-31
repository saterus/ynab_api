module YnabApi
  class Client

    def initialize
    end

    def budgets
      Endpoint::Budgets.new.get
    end

    def accounts(budget_id)
      Endpoint::Accounts.new(budget_id).get
    end

  end
end
