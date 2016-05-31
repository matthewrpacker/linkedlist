require_relative 'linked_list'

class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
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
end
