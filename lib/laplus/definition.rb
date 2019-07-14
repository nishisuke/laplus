# frozen_string_literal: true

module Laplus
  class Definition
    def initialize(method, snippet)
      @method = method
      @snippet = snippet
    end

    def inspect
      "\n#{snippet_offset_indent.chomp}"
    end

    private

    def snippet_offset_indent
      match = lines.first.match(/\A(\s+)/)
      return @snippet unless match

      indent = match.captures.first
      lines.map { |l| l.delete_prefix indent }.join("\n")
    end

    def lines
      @lines ||= @snippet.split("\n")
    end
  end
end
