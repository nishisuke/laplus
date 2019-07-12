# frozen_string_literal: true

require 'test_helper'

describe Laplus::Source do
  describe '#snip_code_at' do
    before do
      @path = ''
      @code = <<~CODE
        def hoge
          :hoge
        end
      CODE
      lines = @code.split("\n").map { |line| "#{line}\n" }
      @reader = MiniTest::Mock.new.expect(:readlines, lines, [@path])
    end

    it 'successes' do
      source = Laplus::Source.new(@path, @reader)
      snippet = source.snip_code_at(1)
      assert_equal @code, snippet
    end
  end
end
