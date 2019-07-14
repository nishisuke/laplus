# frozen_string_literal: true

require 'laplus/extensions/interface'

module Laplus
  module UnboundMethodExtension
    include ExtensionInterface

    def definition(with_super = false)
      MethodDefinition.of(self, with_super)
    end
  end
end
