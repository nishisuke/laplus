# frozen_string_literal: true

module Laplus
  module Helper
    class MethodHelper
      def initialize(_method)
        @_method = _method
      end

      def owner_singleton?
        _method.owner.singleton_class?
      end

      def alias?
        _method.original_name != _method.name
      end

      def singleton_method_of_module?
        owner_singleton? && _method.receiver.kind_of?(Module)
      end

      def super_methods
        _super_methods = [_method]
        while super_method = _super_methods.last.super_method
          _super_methods << super_method
        end
        _super_methods.reverse
      end

      private

      attr_reader :_method
    end
  end
end
