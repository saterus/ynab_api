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

    def categories(budget_id)
      Endpoint::Categories.new(budget_id).get
    end

    def category(budget_id, category_id)
      Endpoint::Category.new(budget_id, category_id).get
    end

  end
end
