require_relative 'node'

class LinkedList
  attr_reader :head

  def initialize(data_string = nil)
    append(data_string) if data_string
  end

  def empty?
    @head == nil
  end

  def append(data_string)
    data_array = data_string.split
    data_count = data_array.count

    if empty?
      @head = Node.new(data_array.shift)
    end

    current_node = tail

    data_array.each do |data|
      current_node.next_node = Node.new(data)
      current_node = current_node.next_node
    end

    data_count
  end

  def tail
    current_node = @head
    until current_node.next_node == nil
      current_node = current_node.next_node
    end
    current_node # TDDO: try removing
  end

  def count
    current_node = @head
    total_nodes = 0
    until current_node == nil
      current_node = current_node.next_node
      total_nodes += 1
    end
    total_nodes
  end

  def prepend(data_string)
    linked_list = LinkedList.new(data_string)
    linked_list.tail.next_node = @head
    @head = linked_list.head
  end

  def includes?(data)
    current_node = @head
    until current_node == nil
      return true if current_node.data == data
      current_node = current_node.next_node
    end
    return false
  end

  # => "tee tee tee tee deep dep dep deep deep bop bop deep"
  # > jb.pop(4)
  # => "deep bop bop deep"
  def pop(reverse_index = 1)
    return "" if empty?

    self_count = count

    if reverse_index > self_count
      reverse_index = self_count
    end

    previous_node = nil
    current_node = @head
    index = self_count - reverse_index
    index.times do
      previous_node = current_node
      current_node = current_node.next_node
    end

    self_head = @head
    @head = current_node
    pop_all = all

    if previous_node
      previous_node.next_node = nil
      @head = self_head
    else
      @head = nil
    end

    pop_all
  end

  # => "deep dep dep deep deep bop bop deep"
  def all
    all = []
    current_node = @head
    until current_node == nil
      all << current_node.data
      current_node = current_node.next_node
    end
    all.join(' ')
  end

  # => "tee tee tee tee deep dep dep deep"
  # > jb.insert(4, "boop bop bop boop")
  # => "tee tee tee tee boop bop bop boop deep dep dep deep"
  def insert(index, data_string)
    current_node = @head

    (index-1).times do
      current_node = current_node.next_node
    end

    next_node = current_node.next_node

    linked_list = LinkedList.new(data_string)
    current_node.next_node = linked_list.head
    linked_list.tail.next_node = next_node

    all
  end

  def find(index_1, nodes_needed)
    all
    current_node = @head
    found = []
    (index_1-1).times do
      current_node = @head
      current_node = current_node.next_node
      (nodes_needed-1).times do
          found << current_node.data
      end
    end
    found.join(' ')
    # (index_1-1).times do
    #   current_node = current_node.next_node
    # end
    # current_node
  end
end



# def find
# one or more elements based on arbitrary
# positions in the list. The first parameter
# indicates the first position to return and
# the second parameter specifies how many
# elements to return.
# e.g. jb.find(8,2) --> index position 8,
  # 2 beats
#end
