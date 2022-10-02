# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new
  end

  def test_stack_implements_LIFO
    @stack.push!('a')
    @stack.push!('b')

    assert { @stack.pop! == 'b' }
    assert { @stack.pop! == 'a' }
    assert { @stack.pop! === nil }
  end

  def test_stack_empty_should_work_correctly
    assert { @stack.empty? }
    @stack.push!('a')
    assert { !@stack.empty? }
    @stack.pop!
    assert { @stack.empty? }
  end

  def test_stack_clear_should_work_correctly
    @stack.push!('a')
    @stack.push!('b')
    assert { @stack.size == 2 }
    @stack.clear!
    assert { @stack.size == 0 }
  end

  def test_stack_size_should_work_correctly
    assert { @stack.size == 0 }
    @stack.push!('a')
    assert { @stack.size == 1 }
    @stack.push!('b')
    assert { @stack.size == 2 }
    @stack.clear!
    assert { @stack.size == 0 }
  end

  def test_stack_to_a_should_return_array
    @stack.push!('a')
    @stack.push!('b')
    expected = %w[a b]
    assert { @stack.to_a == expected }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
