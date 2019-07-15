# frozen_string_literal: true

require 'laplus/ui'

module Laplus
  module InspectStrategy
    class MethodStrategy < Base
        # if with_super && method.respond_to?(:super_method) && method.super_method
        #   method.super_method.definition(with_super) + [MethodDefinition.definition(method)]
        # else
        #   [MethodDefinition.definition(method)]
        # end
      def inspect
        method = inspector.object
        source_location = method.source_location

        snippet = if source_location.nil?
                    '(defined in clang)'
                  elsif !File.exist?(source_location.first)
                    "defined at #{path}. but no such file."
                  else
                    path, line = source_location
                    Source.new(path).snip_code_at(line)
                  end

        lines = snippet.split("\n")
        snippet_offset_indent = UI::IndentionLines.new(lines).offset.indent(1).join("\n")

        <<~DEFINITION
          #{method.inspect}

          #{method.owner.class.name.downcase} #{method.owner.name}
          #{snippet_offset_indent.chomp}
          end
        DEFINITION
      end
    end
  end
end
