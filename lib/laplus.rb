# frozen_string_literal: true

require "laplus/version"

module Laplus
  class Error < StandardError; end

  autoload :Source, 'laplus/source'
  autoload :Definition, 'laplus/definition'

  autoload :IRBCommandExtension, 'laplus/repl_extensions/irb_command_extension'
end

require 'laplus/extensions/method_extension'
require 'laplus/extensions/unbound_method_extension'
require 'laplus/extensions/proc_extension'

[Method, UnboundMethod, Proc].each do |klass|
  klass.include Laplus.const_get("#{klass.name}Extension")
end

# require for side effect
require 'laplus/repl_extensions/pry_command_extension'

