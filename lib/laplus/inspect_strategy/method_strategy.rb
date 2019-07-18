# frozen_string_literal: true

module Laplus
  module InspectStrategy
    class MethodStrategy < Base
      def inspect
        method = inspector.object
        path, line = method.source_location

        method_helper = Helper::MethodHelper.new(method)
        super_methods = method_helper.super_methods

        snippet = if method.source_location.nil?
                    '(defined in clang)'
                  elsif !File.exist?(path)
                    "defined at #{path}. but no such file."
                  else
                    Source.new(path).snip_code_at(line)
                  end

        defined_class_text = if method_helper.singleton_method_of_module?
                               "#{method.receiver.class.name.downcase} #{method.receiver.name}" # ex. module Hoge
                             else
                               "#{method.owner.class.name.downcase} #{method.owner.name}" # ex. module Hoge
                             end

        singleton_class_text = if method_helper.singleton_method_of_module?
                                 '  class << self'
                               end

        if method_helper.singleton_method_of_module?
          def_snippet = snippet.split("\n").first
          if def_snippet.match?(/def self./)
            singleton_class_text = nil
          end
        end

        desc_lines = []
        desc_lines << ''
        desc_lines << "#{path}:#{line}"
        desc_lines << ''
        desc_lines << 'super_methods:'
        desc_lines += super_methods.map { |m|  '  ' + m.inspect.match(/Method: (.+)>\z/).to_a[1] }
        desc_lines << ''
        desc_lines << defined_class_text
        desc_lines << singleton_class_text unless singleton_class_text.nil?
        desc_lines << UI::Indention.split(snippet).offset.indent(singleton_class_text.nil? ? 1 : 2).chomp
        desc_lines << '  end' unless singleton_class_text.nil?
        desc_lines << 'end'

        desc_lines.join("\n")
      end
    end
  end
end
