# frozen_string_literal: true

require 'test_helper'

describe Laplus::InspectStrategy::MethodStrategy do
  before do
    method = 0.method(:to_s)
    inspector = Laplus::Inspector.new(method)
    @method_strategy = Laplus::InspectStrategy::MethodStrategy.new(inspector)
  end

  describe '#inspect' do
    it 'returns string' do
      assert !@method_strategy.inspect.empty?
    end
  end
end
