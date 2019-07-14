# frozen_string_literal: true

module Laplus
  module MethodExtension
    def definition
      return '(defined in clang)' if source_location.nil?

      path, line = source_location

      return "defined at #{path}. but no such file." unless File.exist? path

      snippet = Source.new(path).snip_code_at(line)
      Definition.new(snippet)
    end
  end
end
