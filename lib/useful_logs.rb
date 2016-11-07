require 'configatron'
require 'useful_logs/log_formatter'
require 'useful_logs/engine'

module UsefulLogs
  class << self
    def configure
      yield config
    end

    def defaults
      {
        request_info_class_name: 'RequestInfo'
      }
    end

    def config
      @config ||= Configatron::Store.new(
        Configatron::RootStore.instance,
        name.downcase,
        defaults
      )
    end
  end
end
