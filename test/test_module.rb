# coding: utf-8

require 'test/unit/testcase'
require 'test/unit' if $0 == __FILE__
require 'mocha'

require 'keyword_arguments.rb'

class MixedMethodsTest
  required_arguments :test, :test2
  default_arguments test: 1
  def foo(args = { })
    args
  end

  def bar(var)
    var
  end

  def fisk(args = { })
    args
  end

  default_arguments key: 'value'
  def meow(args = { })
    args
  end

  default_arguments whatever: 'hi'
  def self.blubb(args = { })
    args
  end

  allowed_arguments :key1, :key2
  def limited(args = { })
    args
  end
end

class TestModule < Test::Unit::TestCase
  def setup
    @m = MixedMethodsTest.new
  end

  def test_default_arguments
    h = Hash.new
    h[:test] = 1
    h[:test2] = 2
    assert_equal h, @m.foo(:test2 => 2)

    h = Hash.new
    h[:test] = 3
    h[:test2] = 2
    assert_equal h, @m.foo(:test => 3, :test2 => 2)
  end

  def test_required_arguments
    assert_raises(ArgumentError) { @m.foo }
  end

  def test_normal_methods
    h = Hash.new
    h[:nothing] = nil
    assert_equal 1, @m.bar(1)
    assert_equal h, @m.fisk(:nothing => nil)
  end

  def test_chained_default_arguments
    h = Hash.new
    h[:test] = 1
    h[:test2] = 2
    assert_equal h, @m.foo(:test2 => 2)

    h = Hash.new
    h[:key] = 'value'
    assert_equal h, @m.meow
  end

  def test_singleton_method
    h = Hash.new
    h[:whatever] = 'hi'
    assert_equal h, MixedMethodsTest.blubb
  end

  def test_allowed_arguments
    h = Hash.new
    h[:key1] = 1
    assert_equal h, @m.limited(:key1 => 1)

    h = Hash.new
    h[:key1] = 1
    h[:key2] = 2
    assert_equal h, @m.limited(:key1 => 1, :key2 => 2)

    assert_raises(ArgumentError) { @m.limited(:key1 => 1, :key2 => 2, :key3 => 3) }
  end
end
