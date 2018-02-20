require 'yaml'

module Gilded
  class Config
    attr_reader :defaults
    def initialize
      @defaults = YAML.load_file('config/gilded_config.yml')['defaults']
    end

    def url
      @defaults['url']
    end

    def protocol
      @defaults['protocol']
    end

    def host
      @defaults['host']
    end

    def port
      @defaults['port']
    end

    def path
      @defaults['path']
    end

    def linkedin
      @defaults['linkedin']
    end

    def frankies_flavours
      %w[lemonade ginger-beer creme-soda cola]
    end

    def tokens
      {}.tap do |h|
        h[:jumio] = @defaults['jumio']['token'],
        h[:school_api] = @defaults['school_api']['token'],
        h[:cology] = @defaults['cology']['token'],
        h[:idv] = @defaults['idv']['token'],
        h[:comply_advantage] = @defaults['comply_advantage']['api_token'],
        h[:credit_comm] = @defaults['credit_comm']['token'],
        h[:zendesk] = @defaults['zendesk']['token']
      end
    end

    def echosign
      @defaults['echosign']
    end

    def recaptcha
      @defaults['recaptcha']
    end

    def error_condition
      @defaults['items']
    end
  end
end
