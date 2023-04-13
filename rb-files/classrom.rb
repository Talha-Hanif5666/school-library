require_relative 'students'

class Classroom
  attr_accessor :label, :students

  def initialize(label, _students)
    @label = label
    @students = []
  end

  def add_student(student)
    return unless student.is_a?(Student)

    @students << student
    student.classroom = self
  end
end
