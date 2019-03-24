# frozen_string_literal: true

require 'json'

module NRProto

  MIME_JSON = { 'Content-Type' => 'application/json' }
  MIME_TEXT = { 'Content-Type' => 'text/plain' }

  class App
    def self.call(env)
      request = Rack::Request.new(env)

      path = request.path_info

      if path == '/api/v1/info'
        [200, MIME_JSON, [{ version: '0.1.0' }.to_json]]
      else
        [404, MIME_TEXT, ['Resource not found']]
      end
    end
  end
end
