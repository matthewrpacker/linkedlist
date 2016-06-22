require_relative 'node'

class LinkedList
  attr_reader :head

  def count
    count = 0
    each { count += 1 }
    count
  end

  def each
    current_node = @head
    while current_node
      yield(current_node)
      current_node = current_node.next_node
    end
  end

  def includes?(data)
    each { |n| return true if n.data == data }
    return false
  end

  def prepend(data)
    old_head = @head
    @head = Node.new(data)
    @head.next_node = old_head
    data
  end

  def append(data)
    node = Node.new(data)
    if @head.nil?
      @head = node
    else
      tail.next_node = node
    end
    data
  end

  def insert(index, data)
    return prepend(data) if index == 0
    node = Node.new(data)
    if @head.nil?
      @head = node
    else
      current_node = @head
      (index-1).times do
        current_node = current_node.next_node
      end
      node.next_node = current_node.next_node
      current_node.next_node = node
    end
    data
  end

  def tail
    return nil if @head.nil?
    current_node = @head
    while current_node.next_node
      current_node = current_node.next_node
    end
    current_node
  end

  def empty?
    @head.nil?
  end

  def to_string
    find(0, count)
  end

  def find(index, count)
    found_data = []
    return "" if @head.nil?
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    count.times do
      found_data << current_node.data
      current_node = current_node.next_node
    end
    found_data.join(" ")
  end

  def pop
    return "" if @head.nil?
    current_node = @head
    if !current_node.next_node
      popped_data = current_node.data
      @head = nil
      return popped_data
    end
    while current_node.next_node.next_node
      current_node = current_node.next_node
    end
    popped_data = current_node.next_node.data
    current_node.next_node = nil
    popped_data
  end
end
