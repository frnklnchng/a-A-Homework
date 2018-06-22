class Stacks
  def initialize
    @stack = []
  end

  def push(el)
    stack.push(el)

    el
  end

  def pop
    stack.pop
  end

  def peek
    stack.last
  end

  private
  attr_accessor :stack
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    queue.push(el)

    el
  end

  def dequeue
    queue.shift
  end

  def peek
    queue.first
  end

  private
  attr_accessor :queue
end

class Map
  def initialize
    @map = []
  end

  def set(key, value)
    index = map.index {|el| el.first == key}

    index ? map[index][1] = value : map.push([key, value])

    value
  end

  def get(key)
    map.each {|el| return el[1] if el.first == key}

    nil
  end

  def delete(key)
    value = get(key)

    map.select! {|el| el.first != key}

    value
  end

  def show
    deep_dup(map)
  end

  private
  attr_accessor :map

  def deep_dup(arr)
    arr.map do |el|
      el.is_a?(Array) ? deep_dup(el) : el
    end
  end
end
