require 'yaml'

module Gilded
  class Config
    attr_reader :defaults
    def initialize
      @defaults = YAML.load_file('config/gilded_config.yml')['defaults']
    end

    def error_condition
      @defaults['items']
    end
  end
end
