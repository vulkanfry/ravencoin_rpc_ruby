# frozen_string_literal: true

require 'attr_extras'
require 'active_support/core_ext/module'
require 'json'

class RavencoinRpc::Client::Request
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
    @docs ||= JSON.parse(File.open('docs.json').read)
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
