require "test_helper"

class LaplusTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Laplus::VERSION
  end
end

describe Laplus do
  describe 'Method#lp' do
    it 'returns Laplus::Inspector object' do
      assert_instance_of Laplus::Inspector, 0.method(:to_s).lp
    end
  end

  describe 'UnboundMethod#lp' do
    it 'returns Laplus::Inspector object' do
      assert_instance_of Laplus::Inspector, Class.instance_method(:include).lp
    end
  end
end
