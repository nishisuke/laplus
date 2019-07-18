# frozen_string_literal: true

module Laplus
  module InspectStrategy
    autoload :Base, 'laplus/inspect_strategy/base'
    autoload :MethodStrategy, 'laplus/inspect_strategy/method_strategy'
    autoload :ProcStrategy, 'laplus/inspect_strategy/proc_strategy'
  end
end
