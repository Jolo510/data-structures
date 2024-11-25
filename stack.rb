# Implementation of a Stack using a list
# Methods include
# - Push
# - Pop 
# - Peek
# - Size
# - Empty?

class Stack 
  def initialize
    @stack = []
  end

  def push(value)
    @stack.append(value)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end

  def size
    @stack.length
  end

  def empty? 
    @stack.empty?
  end
end
