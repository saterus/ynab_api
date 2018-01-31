require "ynab_api/configuration"
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
