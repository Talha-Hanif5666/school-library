require_relative 'student'

class Classroom
  def initialize(label)
    @label = label
  end

  attr_accessor :label

  def add_student(student)
    @student = student
  end

  @students << @student
  student.classroom = self
end
