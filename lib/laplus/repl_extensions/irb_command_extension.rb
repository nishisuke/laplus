# frozen_string_literal: true

module Laplus
  module IRBCommandExtension
    def lp_def(method)
      method.definition
    end
  end
end
