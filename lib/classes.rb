class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def to_s
    if value.nil?
      puts 'Empty'
    else
      puts "'#{@value}'"
    end
  end
end

class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @size = 0
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    @tail.nil? ? @head = node : @tail.next_node = node
    @tail = node
    @size += 1
  end

  def prepend(value)
    node = Node.new(value)
    @head.nil? ? @tail = node : node.next_node = @head
    @head = node
    @size += 1
  end

  def size
    puts "List contains #{@size} nodes"
  end

  def head
    print 'Head: '
    @head.to_s
  end

  def tail
    print 'Tail: '
    @tail.to_s
  end

  def at(index)
    return nil if index > @size

    node = @head
    index.times do
      node = node.next_node
    end
    node
  end

  def pop
    return if @size.zero?

    node = @head
    node = node.next_node until node.next_node == @tail
    node.next_node = nil
    @tail = node
    @size -= 1
  end

  def contains?(value)
    node = @head
    return node.value == value if node == @tail

    until node.nil?
      return true if node.value == value

      node = node.next_node
    end
    false
  end

  def find(value)
    node = @head
    count = 0
    return nil if node == @tail

    until node.nil?
      return count if node.value == value

      count += 1
      node = node.next_node
    end
    print 'Not found'
    nil
  end

  def to_s
    node = @head
    output = ''
    until node.nil?
      output += "( #{node.value} ) -> "
      node = node.next_node
    end
    puts output += 'nil'
  end

  def insert_at(value, index)
    return puts 'Out of Range!' if index > @size
    return prepend(value) if index.zero?

    current_node = @head
    count = 0
    (0..index).each do
      current_node = current_node.next_node
      count += 1
      next unless count == index

      @size += 1
      return append(value) if current_node.next_node.nil?

      current_node.next_node = Node.new(value, current_node.next_node)
    end
  end

  def remove_at(index)
    return puts 'Out of Range!' if index > @size

    @size -= 1
    return @head = @head.next_node if index.zero?
    return pop if index == @size

    current_node = @head
    previous_node = nil

    (0..index).each do
      previous_node = current_node
      current_node = current_node.next_node
    end
    previous_node.next_node = current_node.next_node
  end
end
