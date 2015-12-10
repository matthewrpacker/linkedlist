require_relative 'node'
require 'pry'

class LinkedList
  attr_reader :data, :head

  def initialize(data)
    @head = Node.new(data)
  end

  def tail
    current_node = @head
    until current_node.next_node == nil
      current_node = current_node.next_node
    end
    current_node
  end

  def count
    current_node = @head
    c = 1
    until current_node.next_node == nil
      current_node = current_node.next_node
      c += 1
    end
    c
  end

  def append(data)
    new_node = Node.new(data)
    tail.next_node = new_node
  end

  def prepend(data)
    current_node = @head
    @head = Node.new(data)
    @head.next_node = current_node
  end

  def include?(data)
    current_node = @head
    return true if current_node.data == data
    until current_node.next_node == nil
      current_node = current_node.next_node
      if current_node.data == data
        response = true
      elsif current_node.next_node == nil
        response = false
      end
    end
    response
  end

  def pop(number = 1)
    current_node = @head
    number.times do
      until current_node.next_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node.next_node = nil
    end
  end

end

# def all
#   current_node = @head
#   ordered_list = []
#   current_node.data.each do |d|
#     until current_node.next_node == nil
#       current_node = current_node.next_node
#       ordered_list << d
#     end
#   end
#   ordered_list.to_s.join.reverse
# end
