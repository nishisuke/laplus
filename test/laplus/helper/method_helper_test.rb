# frozen_string_literal: true

require 'test_helper'

class TestFuga
  def _instance_method
  end
end

class TestHoge < TestFuga
  class << self
    def _class_method
    end
  end

  def _instance_method
    super
  end

  alias _method _instance_method
end

module TestFoo
  def _extend_method
  end
end

describe Laplus::Helper::MethodHelper do
  before do
    hoge = TestHoge.new
    hoge.extend TestFoo
    hoge.define_singleton_method(:_object_singleton_method) { nil }
    
    @methods = [
      TestHoge.method(:_class_method),
      hoge.method(:_method),
      hoge.method(:_instance_method),
      hoge.method(:_extend_method),
      hoge.method(:_object_singleton_method),
    ]
  end

  describe '#super_methods' do
    it 'returns super tree array' do
      super_methods_array = @methods.map do |method|
        Laplus::Helper::MethodHelper.new(method).super_methods.count
      end

      assert_equal super_methods_array, [1, 1, 2, 1, 1]
    end
  end

  describe '#alias?' do
    it 'returns bool' do
      super_methods_array = @methods.map do |method|
        Laplus::Helper::MethodHelper.new(method).alias?
      end

      assert_equal super_methods_array, [false, true, false, false, false]
    end
  end

  describe '#owner_singleton?' do
    it 'returns bool' do
      super_methods_array = @methods.map do |method|
        Laplus::Helper::MethodHelper.new(method).owner_singleton?
      end

      assert_equal super_methods_array, [true, false, false, false, true]
    end
  end

  describe '#singleton_method_of_module?' do
    it 'returns bool' do
      super_methods_array = @methods.map do |method|
        Laplus::Helper::MethodHelper.new(method).singleton_method_of_module?
      end

      assert_equal super_methods_array, [true, false, false, false, false]
    end
  end
end
