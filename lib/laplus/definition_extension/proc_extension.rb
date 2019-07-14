# frozen_string_literal: true

module Laplus
  module DefinitionExtension
    module ProcExtension
      include DefinitionExtension

      def definition(with_super = false)
        ProcDefinition.of(self, with_super)
      end
    end
  end
end
