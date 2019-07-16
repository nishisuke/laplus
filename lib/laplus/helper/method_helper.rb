# frozen_string_literal: true

module Laplus
  module Helper
    class MethodHelper
      def initialize(_method)
        @_method = _method
      end

      def is_alias?
        _method.original_name != _method.name
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
