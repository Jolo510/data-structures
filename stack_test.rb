require './test_helper'
require './stack'

class StackTest < Minitest::Test
  def test_init
    stack = Stack.new

    refute_nil stack
  end

  def test_push
    stack = Stack.new

    expected = 1
    stack.push(expected)
    
    assert_equal 1, stack.size
    assert_equal expected, stack.peek
  end

  def test_pop
    stack = Stack.new

    expected = 1
    stack.push(expected)

    pop_val = stack.pop()
    assert_equal expected, pop_val
    assert_equal 0, stack.size
  end

  def test_pop_empty
    stack = Stack.new
    assert_nil stack.pop
  end

  def test_peek
    stack = Stack.new

    expected = 1
    stack.push(expected)

    assert_equal expected, stack.peek
    assert_equal 1, stack.size
  end
  
  def test_peek_empty
    stack = Stack.new

    assert_nil stack.peek
  end

  def test_size_empty
    stack = Stack.new

    assert_equal 0, stack.size
  end

  def test_size_one
    stack = Stack.new
    stack.push(1)

    assert_equal 1, stack.size
  end
  
  def test_size_after_push_pop
    stack = Stack.new
    stack.push(1)
    stack.pop
    
    assert_equal 0, stack.size
  end
end