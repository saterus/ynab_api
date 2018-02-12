module YnabApi
  class Client

    def initialize
    end

    def budgets
      Endpoint::Budgets.new.get
    end

    def budget(budget_id)
      budgets.detect { |b| b.id == budget_id }
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

    def months(budget_id)
      Endpoint::Months.new(budget_id).get
    end

    def month(budget_id, month)
      Endpoint::Month.new(budget_id, month).get
    end

    def transactions(budget_id, opts = {})
      Endpoint::Transactions.new(budget_id).get(**opts)
    end

    def transaction(budget_id, transaction_id)
      Endpoint::Transactions.new(budget_id, transaction_id).get
    end

  end
end
