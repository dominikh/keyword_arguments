class MixedMethodsTest
  default_arguments {{test: 1}}
  def default_arguments(args = { })
    args
  end

  required_arguments :test
  def required_arguments(args = {})
    args
  end

  required_arguments :test, :test2
  default_arguments {{test: 1}}
  def default_and_required_arguments(args = {})
    args
  end

  def normal_method(var)
    var
  end

  def normal_method_with_hash(args = { })
    args
  end

  default_arguments {{key: 'value'}}
  def other_default_arguments(args = { })
    args
  end

  default_arguments {{whatever: 'hi'}}
  def self.blubb(args = { })
    args
  end

  allowed_arguments :key1, :key2
  def allowed_arguments(args = { })
    args
  end
end

BareTest.suite("keyword_arguments") do
  setup do
    @m = MixedMethodsTest.new
  end

  suite "default arguments" do
    assert "a method has default arguments" do
      h = {test: 1}
      equal h, @m.default_arguments
    end

    assert "every method has its own default arguments" do
      h1 = {test: 1}
      h2 = {key: 'value'}
      equal h1, @m.default_arguments
      equal h2, @m.other_default_arguments
    end

    assert "default arguments can be complemented" do
      h = {test: 1, test2: 2}
      equal h, @m.default_arguments(test2: 2)
    end

    assert "default arguments can be overwritten" do
      h = {test: 2}
      equal h, @m.default_arguments(test: 2)
    end
  end

  suite "required arguments" do
    assert "a method has required arguments" do
      h = {test: 1}

      raises(ArgumentError) { @m.required_arguments }
      equal h, @m.required_arguments(test: 1)
    end

    assert "default arguments can provide values for required arguments" do
      h = {test: 1, test2: 2}

      raises(ArgumentError) { @m.default_and_required_arguments }
      equal h, @m.default_and_required_arguments(test2: 2)
    end
  end

  suite "allowed arguments" do
    assert "a method has a fixed set of allowed arguments" do
      h1 = {}
      h2 = {key1: 1}
      h3 = {key2: 2}
      h4 = {key1: 1, key2: 2}

      equal h1, @m.allowed_arguments
      equal h2, @m.allowed_arguments(key1: 1)
      equal h3, @m.allowed_arguments(key2: 2)
      equal h4, @m.allowed_arguments(key1: 1, key2: 2)
      raises(ArgumentError) { @m.allowed_arguments(key1: 1, key2: 2, key3: 3) }
    end
  end

  suite "normal methods..." do
    assert "... are unaffected by keyword_arguments" do
      h = {nothing: nil}
      equal 1, @m.normal_method(1)
      equal h, @m.normal_method_with_hash(h)
    end
  end

  suite "singleton classes..." do
    assert "... work as well" do
      h = {test: 1}
      equal h, @m.default_arguments
    end
  end
end
