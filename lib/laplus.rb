# frozen_string_literal: true

require "laplus/version"

module Laplus
  class Error < StandardError; end
  # Your code goes here...

  autoload :Source, 'laplus/source'
  autoload :Definition, 'laplus/definition'

  autoload :IRBCommandExtension, 'laplus/extensions/irb_command_extension'
end

require 'Laplus/extensions/method_extension'

# [Method, UnboundMethod].each { @1.include Laplus::MethodExtension }
[Method, UnboundMethod].each do |klass|
  klass.include(Laplus::MethodExtension)
end

begin
  require 'pry'

  Pry::Commands.block_command :lp_def, 'show arg method definition' do |method_str|
    m = target.eval(method_str)
    definition = m.definition
    output.p definition
  end
rescue LoadError
end
