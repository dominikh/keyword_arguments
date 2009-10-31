## Keyword arguments

This little project tries to add a handful of convenient methods to
Module, which make working with argument hashes in Ruby a bit easier.

## Requirements

- This only works with Ruby 1.9. This, however, is as far as I know no
  big problem because there is also a gem for Ruby 1.8...

## Installation

    # gem install keyword_arguments
(the gem can be found both on github and rubyforge)

## Usage

    require 'keyword_arguments'

    class Test
      default_arguments {{a: 1, b: 2, c: 3}}
      def laissez_faire(args = {})
        args
      end

      required_arguments :a, :b
      def strict(args = { })
        args
      end

      required_arguments :a, :b
      allowed_arguments  :a, :b
      def even_stricter(args = { })
        args
      end
    end

    t = Test.new
    t.laissez_faire                  # => {:a=>1, :b=>2, :c=>3}
    t.laissez_faire a: 4, d: 5       # => {:a=>4, :b=>2, :c=>3, :d=>5}

    t.strict a: 1, b: 2              # => {:a=>1, :b=>2}
    t.strict                         # ~> -:26:in `<main>': Missing arguments: a, b (ArgumentError)

    t.even_stricter a: 1, b: 2       # => {:a=>1, :b=>2}
    t.even_stricter a: 1, b: 2, c: 3 # ~> -:29:in `<main>': Unknown arguments: c (ArgumentError)

Of course you can combine all of the three different methods
(`default_arguments`, `required_arguments` and `allowed_arguments`)

This also works with methods on singleton classes ("class methods"),
modules and included modules.

## Special notes

* You shouldn't redefine any of the \*\_arguments methods
  (as in

      class Test; def self.default_arguments; nil; end; end

  because then you won't be able to use the ones from our package
  unless you use `::Module.default_arguments`

* default arguments are to be passed as blocks returning hashes.
