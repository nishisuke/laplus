require "test_helper"

class LaplusTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Laplus::VERSION
  end
end

describe 'Method' do
  it 'includes Laplus::Extension' do
    assert_includes Method, Laplus::Extension
  end
end

describe 'UnboundMethod' do
  it 'includes Laplus::Extension' do
    assert_includes UnboundMethod, Laplus::Extension
  end
end

describe 'Proc' do
  it 'includes Laplus::Extension' do
    assert_includes Proc, Laplus::Extension
  end
end

describe Laplus::Extension do
  describe '#lp' do
    before do
      @object = Object.new
      @object.extend Laplus::Extension
    end

    it 'returns Laplus::Inspector object' do
      assert_instance_of Laplus::Inspector, @object.lp
    end
  end
end
