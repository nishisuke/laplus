# frozen_string_literal: true

module Laplus
  module InspectStrategy
    class Base
      def initialize(inspector)
        @inspector = inspector
      end

      def inspect
        raise NotImplementedError
      end

      private

      attr_reader :inspector
    end
  end
end
