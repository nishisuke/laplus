# frozen_string_literal: true

require 'laplus/inspect_strategy'

module Laplus
  class Inspector
    attr_reader :object

    def initialize(object)
      @object = object.freeze
    end

    def inspect
      inspect_strategy.inspect
    end

    private

    def inspect_strategy
      case object
      when Method, UnboundMethod
        InspectStrategy::MethodStrategy.new(self)
      when Proc
        raise NotImplementedError
      else
        raise NotImplementedError
      end
    end
  end
end
