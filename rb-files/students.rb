require_relative './persons'

# Student class represents a student in a school.
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
