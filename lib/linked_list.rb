require_relative 'node'

class LinkedList
  attr_reader :head

  def count
    count = 0
    current_node = @head
    while current_node
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def append(data)
    node = Node.new(data)
    if @head.nil?
      @head = node
    else
      tail.next_node = node
    end
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

  #  @head
  #    v
  # ["doop"] -> nil

  #  @head        cn = bop
  #    v
  # ["doop"] -> ["bop"] -> ["beep"] -> nil
  def to_string
    all_node_data = []
    current_node = @head
    while current_node
      all_node_data << current_node.data
      current_node = current_node.next_node
    end
    all_node_data.join(" ")
  end
end
