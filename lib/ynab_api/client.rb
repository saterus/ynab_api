module YnabApi
  class Client

    def initialize
    end

    def budgets
      Endpoint::Budgets.new.get
    end
  end
end
