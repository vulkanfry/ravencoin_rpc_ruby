# frozen_string_literal: true

class RavencoinRpc::Exceptions::NotFoundModule < StandardError
  attr_reader :object

  def initialize(object = {})
    super(object)
  end
end
