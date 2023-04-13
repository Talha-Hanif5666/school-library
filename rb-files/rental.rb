class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self if book # Make sure book is not nil
    @person = person
    person.rentals << self if person
  end
end
