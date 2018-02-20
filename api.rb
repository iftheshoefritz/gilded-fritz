require 'net/http'
require 'json'
require './config/config'

module Gilded
  class API
    def self.items
      config = Gilded::Config.new
      defaults = config.defaults
      uri = URI.parse("#{defaults['protocol']}://#{defaults['host']}:#{defaults['port']}/#{defaults['path']}")
      req = Net::HTTP::Get.new(uri.to_s)
      items = begin
                res = Net::HTTP.start(uri.host, uri.port) do |http|
                  http.request(req)
                end
                JSON.parse(res.body)
              rescue StandardError
                config.error_condition
              end
      items
    end
  end
end
