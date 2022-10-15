# frozen_string_literal: true

require 'faraday_middleware'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/module'

# This is base module
module RavencoinRpc
  # This is base class
  class Client
    # This class fetch data from ravencoin node
    class Fetcher
      pattr_initialize %i[url! payload! auth!] do
        @payload ||= {}
      end

      def response_json
        response.as_json
      end

      delegate :body, to: :response

      def result
        prettify_result.call
      end

      private

      def prettify_result
        lambda do
          result = body['result']
          result = result.with_indifferent_access if result.is_a?(Hash)

          result
        end
      end

      def response
        @response ||= connection.post('/', payload.to_json)
      end

      def connection
        @connection ||=
          Faraday.new(url) do |f|
            f.adapter Faraday.default_adapter
            f.use FaradayMiddleware::FollowRedirects, limit: 5
            f.use Faraday::Response::RaiseError
            f.headers = { 'Accept' => 'application/json' }
            f.request(:retry, faraday_retry_opt)
            f.request :basic_auth, auth.login, auth.password
            f.response :json
          end
      end

      def faraday_retry_opt
        {
          max: 2,
          interval: 0.5,
          interval_randomness: 0.5,
          backoff_factor: 2
        }
      end
    end
  end
end
