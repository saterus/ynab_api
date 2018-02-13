require 'forwardable'
require 'faraday'
require 'faraday_middleware'

module YnabApi
  class Connection
    extend Forwardable

    BASE_URL = "https://api.youneedabudget.com".freeze 

    def_delegators :conn, :get, :post, :put

    def initialize
    end

    def conn
      @conn ||= Faraday.new(url: BASE_URL) do |f|
        f.request :json
        f.authorization :Bearer, YnabApi.config.api_key

        # TODO: write middleware to handle errors
        # f.response :api_errors
        f.response :json
        if YnabApi.config.verbose_http_logging
          f.response :logger, nil, bodies: { request: true, response: true }
        else
          f.response :logger
        end

        f.adapter Faraday.default_adapter
      end
    end
  end
end
