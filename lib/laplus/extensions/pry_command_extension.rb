# frozen_string_literal: true

begin
  require 'pry'

  Pry::Commands.block_command :lp_def, 'show arg method definition' do |method_str|
    m = target.eval(method_str)
    definition = m.definition
    output.p definition
  end
rescue LoadError
end
