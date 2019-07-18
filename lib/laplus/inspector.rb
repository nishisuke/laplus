# frozen_string_literal: true

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
        InspectStrategy::ProcStrategy.new(self)
      else
        raise NotImplementedError
      end
    end
  end
end
