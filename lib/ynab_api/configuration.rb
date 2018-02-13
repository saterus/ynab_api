require 'singleton'

module YnabApi
  class Configuration
    include Singleton

    attr_accessor :api_key, :verbose_http_logging
  end
end
