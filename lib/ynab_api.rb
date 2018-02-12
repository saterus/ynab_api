require "ynab_api/client"
require "ynab_api/configuration"
require "ynab_api/connection"
require "ynab_api/data/account"
require "ynab_api/data/budget"
require "ynab_api/data/category"
require "ynab_api/data/category_group"
require "ynab_api/data/money"
require "ynab_api/endpoint/accounts"
require "ynab_api/endpoint/budgets"
require "ynab_api/endpoint/categories"
require "ynab_api/endpoint/category"
require "ynab_api/version"

module YnabApi

  # YnabApi.config.api_key
  def self.config
    YnabApi::Configuration.instance
  end

  # YnabApi.configure do |c|
  #   c.api_key = ENV['YNAB_API_KEy']
  # end
  def self.configure
    yield YnabApi::Configuration.instance
  end
end
