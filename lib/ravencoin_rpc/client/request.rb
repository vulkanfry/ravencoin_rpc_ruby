# frozen_string_literal: true

require 'attr_extras'
require 'active_support/core_ext/module'
require 'json'

module RavencoinRpc
  class Client
    # This is class to validate selected method and generate requst params
    class Request
      pattr_initialize %i[method! args] do
        @args ||= []
      end

      delegate :call, to: :data

      private

      def data
        -> { valid? ? prepare_data : error }
      end

      def valid?
        methods.include?(method)
      end

      def methods
        @methods ||= docs.keys
      end

      def docs
        @docs ||= JSON.parse(File.open(Gem::Specification.find_by_name("ravencoin_rpc_ruby").gem_dir + '/docs.json').read)
      end

      def error
        raise RavencoinRpc::Exceptions::NotFoundModule, 'method not included into methods list'
      end

      def prepare_data
        {
          jsonrpc: '2.0',
          id: rand(10),
          method: method,
          params: args
        }
      end
    end
  end
end
