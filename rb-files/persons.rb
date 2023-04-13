require_relative './nameable'
require_relative './rental'
require_relative './book'
# Class Person Documentation
class Person < Nameable
  attr_accessor :name, :age, :books, :rentals
  attr_reader :id

  def initialize(age, name, parent_permission)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @books = []
    @rentals = []
    super()
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
