# frozen_string_literal: true

module Laplus
  module MethodExtension
    class << self
      def definition(method)
        return '(defined in clang)' if method.source_location.nil?

        path, line = method.source_location

        return "defined at #{path}. but no such file." unless File.exist? path

        snippet = Source.new(path).snip_code_at(line)
        Definition.new(method, snippet)
      end
    end

    def definition(with_super = false)
      if with_super && respond_to?(:super_method) && super_method
        super_method.definition(with_super) + [MethodExtension.definition(self)]
      else
        [MethodExtension.definition(self)]
      end
    end
  end
end
