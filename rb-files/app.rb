require_relative 'book'
require_relative 'persons'
require_relative 'students'
require_relative 'teachers'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def welcome
    puts 'Welcome to School Library App!\n'
  end

  def list_books
    if @books.empty?
      puts 'No books found'
    else
      @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    end
  end

   def show_person(person)
     print "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
     puts ", Specialization: #{person.specialization}" if person.instance_of?(Teacher)
     puts ", Classroom: #{person.classroom}" if person.instance_of?(Student)
 end

def list_people
    return puts 'No people found' if @people.empty?
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person
    print 'Do you want to Create a students (1) or a teacher (2)? [Input the number]: '
    select_person = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    case select_person
    when 1
      print 'Has parent permission? [Y/N]: '
      permission = gets[0].capitalize
      permission = permission == 'Y'
      @people << Student.new(nil, age, name, permission)
    when 2
      print 'Specialization: '
      specialization = gets.chomp
      @people << Teacher.new(age, name, specialization)
    end
    puts 'Person created successfully'
  end


  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) #{book.title}, #{book.author}" }

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      print "#{index}) "
      show_person(person)
    end

    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date, @books[book_index], @people[person_index]))
    puts 'Rental created successfully'
  end

  def list_rentals_by_person_id
    print 'ID of person: '
    id = gets.chomp.to_i
  
    puts 'Rentals:'
    rentals_found = false
  
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
        rentals_found = true
      end
    end
  
    puts 'No rentals found for the specified person ID' unless rentals_found
  end
end