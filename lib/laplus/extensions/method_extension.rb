# frozen_string_literal: true

module Laplus
  module MethodExtension
    def definition
      path, line = source_location
      snippet = Source.new(path).snip_code_at(line)
      Definition.new(snippet)
    end
  end
end
