# frozen_string_literal: true

module Laplus
  module DefinitionExtension
    module MethodExtension
      include DefinitionExtension

      def definition(with_super = false)
        MethodDefinition.of(self, with_super)
      end
    end
  end
end
