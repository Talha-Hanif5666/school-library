require_relative './persons'
# Teacher class represents a teacher in a school.
class Teacher < Person
  attr_reader :specialization

  def initialize(age, name, specialization, parent_permission: true)
    super(age, name, parent_permission:)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
