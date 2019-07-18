# frozen_string_literal: true

module Laplus
  module InspectStrategy
    class ProcStrategy < Base
      def inspect
        _proc = inspector.object

        path, line = _proc.source_location

        snippet = if _proc.source_location.nil?
                    '(defined in clang)'
                  elsif !File.exist?(path)
                    "defined at #{path}. but no such file."
                  else
                    Source.new(path).snip_code_at(line)
                  end


        desc_lines = []
        desc_lines << ''
        desc_lines << "#{path}:#{line}"
        desc_lines << ''
        desc_lines << UI::Indention.split(snippet).offset.indent(0).chomp

        desc_lines.join("\n")
      end
    end
  end
end
