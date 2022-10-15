# frozen_string_literal: true

require 'attr_extras'
require 'ostruct'

module RavencoinRpc
  # This is base class
  class Client
    pattr_initialize %i[url! login! password!]

    def call(method, args = [])
      send_method!.call(method, args)
    end

    private

    def auth
      @auth ||= OpenStruct.new(
        login: login,
        password: password
      )
    end

    def send_method!
      lambda { |method, args|
        RavencoinRpc::Client::Fetcher.new(url: url, payload: payload.call(method, args), auth: auth).result
      }
    end

    def payload
      ->(method, args) { prepare_and_check_data.call(method, args) }
    end

    def prepare_and_check_data
      lambda do |method, args|
        client_request.call(method, args).call
      end
    end

    def client_request
      ->(method, args) { RavencoinRpc::Client::Request.new(method: method, args: args) }
    end
  end
end
