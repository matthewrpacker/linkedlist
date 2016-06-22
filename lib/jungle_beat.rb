require_relative 'linked_list'

class JungleBeat
  attr_reader :list
  attr_accessor :rate, :voice

  def initialize
    @list = LinkedList.new
    reset_rate
    reset_voice
  end

  def append(data)
    data.split.each { |d| @list.append(d) }
    data
  end

  def count
    @list.count
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = 'Boing'
  end

  def play
    beats = @list.to_string
    `say -r #{@rate} -v #{@voice} #{beats}`
    count
  end
end
