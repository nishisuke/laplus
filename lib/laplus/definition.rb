# frozen_string_literal: true

module Laplus
  class Definition
    def initialize(method, snippet)
      @method = method
      @snippet = snippet
    end

    def inspect
      <<~DEFINITION
        #{@method.inspect}

        #{@method.owner.class.name.downcase} #{@method.owner.name}
        #{snippet_offset_indent.chomp}
        end
      DEFINITION
    end

    private

    def snippet_offset_indent
      match = lines.first.match(/\A(\s+)/)
      return @snippet unless match

      indent = match.captures.first
      lines.map { |l| "  #{l.delete_prefix(indent)}" }.join("\n")
    end

    def lines
      @lines ||= @snippet.split("\n")
    end
  end
end
