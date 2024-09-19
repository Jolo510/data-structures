# Implementation of a Queue using a list
# Methods include
# - Push
# - Pop 
# - Peek
# - Size
# - Empty?

class Queue
  def initialize
    @queue = []
  end

  def push(val)
    @queue.unshift(val)
  end

  def pop
    return if @queue.nil? # For some reason, this is needed for MiniTest

    @queue.shift
  end

  def peek
    @queue.first
  end

  def size
    @queue.length
  end

  def empty?
    @queue.empty?
  end
end
