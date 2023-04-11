require './persons'
require './decorator'

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = Capitalize.new(person)
puts capitalized_person.correct_name
capitalized_primmed_person = Trimmer.new(capitalized_person)
puts capitalized_primmed_person.correct_name
