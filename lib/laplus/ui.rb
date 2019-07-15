# frozen_string_literal: true

module Laplus
  module UI
    class IndentionLines
      INDENTION_REGEX = /\A(\s+)/

      def initialize(lines, padding = '  ')
        @lines = lines.clone(freeze: false)
        @padding = padding.freeze
      end

      def offset
        if (match = lines.first&.match(INDENTION_REGEX))
          indention = match.captures.first
          lines.map! { |line| line.delete_prefix(indention) }
        end

        self
      end

      def indent(depth)
        indention = padding * depth
        lines.map { |line| "#{indention}#{line}" }
      end

      private

      attr_reader :lines, :padding
    end
  end
end
