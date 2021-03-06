# frozen_string_literal: true

require "laplus/version"

module Laplus
  class Error < StandardError; end

  module Extension
    def lp
      Laplus::Inspector.new(self)
    end
  end

  autoload :Inspector, 'laplus/inspector'
  autoload :Source, 'laplus/source'
  autoload :InspectStrategy, 'laplus/inspect_strategy'

  autoload :UI, 'laplus/ui'
  autoload :Helper, 'laplus/helper'

  autoload :IRBCommandExtension, 'laplus/repl_extensions/irb_command_extension'
end

[Method, UnboundMethod, Proc].each do |klass|
  klass.include Laplus::Extension
end

# require for side effects
require 'laplus/repl_extensions/pry_command_extension'

