# frozen_string_literal: true

module Laplus
  module DefinitionExtension
    def definition_with_super
      definition(true)
    end

    def definition(with_super = false)
      raise NotImplementedError
    end
  end
end
