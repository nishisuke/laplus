# frozen_string_literal: true

require 'laplus/extensions/interface'

module Laplus
  module ProcExtension
    include ExtensionInterface

    def definition(with_super = false)
      ProcDefinition.of(self, with_super)
    end
  end
end
