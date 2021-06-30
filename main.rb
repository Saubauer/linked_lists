require_relative 'lib/classes'

list = LinkedList.new
list.prepend('after')
list.append('before')
list.append('Something')
list.prepend('Doggy')
list.append('Why?')
list.pop
list.size
list.head
list.tail
puts '----'
list.at(3).to_s
puts '----'
puts list.contains?('Why?')
puts list.contains?('Doggy')
puts '----'
puts list.find('Doge')
puts list.find('Something')
puts '----'
list.to_s
list.insert_at('Bob', 2)
puts '----'
list.to_s
puts '----'
list.insert_at('Jimbo', 4)
list.remove_at(2)
list.to_s
puts '----'
list.tail
