require './persons'
require './decorator'

person = Person.new(22, 'maximilianus')
  puts person.correct_name
  capitalizedPerson = Capitalize.new(person)
  puts capitalizedPerson.correct_name
  capitalizedTrimmedPerson = Trimmer.new(capitalizedPerson)
  puts capitalizedTrimmedPerson.correct_name