require './persons'
# Teacher class represents a teacher in a school.
class Teacher < Person
  def initialize(age, specialization, name = 'unknown', parent_permission: true)
    super(name, age, parent_permission:)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
