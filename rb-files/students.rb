require_relative './persons'

# Student class represents a student in a school.
class Student < Person
  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(name, age, parent_permission)
    self.classroom = classroom
  end

  attr_reader :classroom

  def classroom=(classroom)
    @classroom&.students&.delete(self)
    @classroom = classroom
    @classroom&.students&.push(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
