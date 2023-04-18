require_relative 'inputhandler'

# class App
#   def initialize
#     @books = []
#     @people = []
#     @rentals = []
#   end

#   def list_books
#     if @books.empty?
#       puts 'No books found'
#     else
#       @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
#     end
#   end

#   def list_people
#     return puts 'No people found' if @people.empty?

#     @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
#   end

#   def create_person
#     print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
#     select_person = gets.chomp.to_i
#     print 'Name: '
#     name = gets.chomp
#     print 'Age: '
#     age = gets.chomp.to_i
#     case select_person
#     when 1
#       create_student(name, age)
#     when 2
#       create_teacher(name, age)
#     end
#     puts 'Person created successfully'
#   end

#   def create_student(name, age)
#     print 'Has parent permission? [Y/N]: '
#     permission = gets[0].capitalize
#     permission = permission == 'Y'
#     print 'What is the student\'s classroom? '
#     classroom = gets.chomp
#     @people.push(Student.new(age, name, permission, classroom))
#   end

#   def create_teacher(name, age)
#     print 'Specialization: '
#     specialization = gets.chomp
#     @people << Teacher.new(age, name, specialization)
#   end

#   def create_book
#     print 'Title: '
#     title = gets.chomp
#     print 'Author: '
#     author = gets.chomp
#     @books << Book.new(title, author)
#     puts 'Book created successfully'
#   end

#   def create_rental
#     puts 'Select a book from the following list by number'
#     @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
#     book_index = gets.chomp.to_i
#     puts 'Select a person from the following list by number (not ID)'
#     @people.each_with_index do |person, index|
#       puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
#     end
#     person_index = gets.chomp.to_i
#     print 'Date: '
#     date = gets.chomp
#     selected_person = @people[person_index]
#     @rentals.push(Rental.new(date, @books[book_index], selected_person))
#     puts 'Rental created successfully'
#   end

#   def list_rentals_by_person_id
#     print 'ID of person: '
#     id = gets.chomp.to_i
#     puts 'Rentals:'
#     rentals_found = false
#     @rentals.each do |rental|
#       if rental.person && rental.person.id == id && rental.book
#         puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
#         rentals_found = true
#       end
#     end
#     puts 'No rentals found for the specified person ID' unless rentals_found
#   end

#   def exit_program
#     puts 'Thank you for using this app!'
#     exit 0
#   end
# end

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @input_handler = InputHandler.new
  end

  def list_books
    if @books.empty?
      puts 'No books found'
    else
      @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    end
  end

  def list_people
    return puts 'No people found' if @people.empty?

    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person
    select_person = @input_handler.select_person_type
    name = @input_handler.person_name
    age = @input_handler.person_age
    case select_person
    when 1
      permission = @input_handler.permission
      classroom = @input_handler.student_classroom
      @people << Student.new(age, name, permission, classroom)
    when 2
      specialization = @input_handler.teacher_specialization
      @people << Teacher.new(age, name, specialization)
    end
    puts 'Person created successfully'
  end

  def create_book
    title = @input_handler.book_title
    author = @input_handler.book_author
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    book_index = @input_handler.select_book_index(@books)
    person_index = @input_handler.select_person_index(@people)
    date = @input_handler.rental_date

    selected_person = @people[person_index]
    @rentals.push(Rental.new(date, @books[book_index], selected_person))
    puts 'Rental created successfully'
  end

  def list_rental_of_person
    print 'ID of person: '
    id = @input_handler.collect_person_id
    puts 'Rentals:'
    rentals_found = false
    @rentals.each do |rental|
      if rental.person && rental.person.id == id && rental.book
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
        rentals_found = true
      end
    end
    puts 'No rentals found for the specified person ID' unless rentals_found
  end

  def exit_program
    puts 'Thank you for using this app!'
    exit 0
  end
end
