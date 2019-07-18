# frozen_string_literal: true

require 'test_helper'

describe Laplus::InspectStrategy::ProcStrategy do
  before do
    _proc = Proc.new { 1 }
    inspector = Laplus::Inspector.new(_proc)
    @proc_strategy = Laplus::InspectStrategy::ProcStrategy.new(inspector)
  end

  describe '#inspect' do
    it 'returns string' do
      assert !@proc_strategy.inspect.empty?
    end
  end
end
