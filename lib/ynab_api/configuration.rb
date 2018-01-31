require 'singleton'

module YnabApi
  class Configuration
    include Singleton

    attr_accessor :api_key
  end
end
