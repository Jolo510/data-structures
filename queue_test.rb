require './test_helper'
require './queue'


class QueueTest < Minitest::Test
  def test_initialize
    queue = Queue.new

    refute_nil queue
  end

  def test_push
    queue = Queue.new
    elem = 1
    queue.push(elem)

    assert_equal 1, queue.size
    assert_equal elem, queue.peek
  end

  def test_pop
    queue = Queue.new
    elem = 1
    queue.push(elem)
    
    assert_equal elem, queue.pop
    assert_equal 0, queue.size
  end

  def test_pop_with_large_queue
    queue = Queue.new
    queue.push(100)
    elem = 1
    queue.push(elem)

    assert_equal elem, queue.pop
    assert_equal 1, queue.size
  end

  def test_peek_with_empty
    queue = Queue.new

    assert_nil queue.peek
  end

  def test_peek
    queue = Queue.new
    elem = 1
    queue.push(elem)

    assert_equal elem, queue.peek
    assert_equal 1, queue.size
  end

  def test_size
    queue = Queue.new

    queue.push(1)
    assert_equal 1, queue.size
  end

  def test_size_with_empty
    queue = Queue.new

    assert_equal 0, queue.size
  end

  def test_empty
    queue = Queue.new
    
    assert queue.empty?
  end

  def test_empty_with_elements
    queue = Queue.new
    queue.push(1)

    refute queue.empty?
  end
end
