# frozen_string_literal: true

# This is base module
module RavencoinRpc
  module Exceptions
    # This is class for error if method not included to a methods list
    class NotFoundModule < StandardError
      attr_reader :object

      def initialize(object = {})
        super(object)
      end
    end
  end
end
