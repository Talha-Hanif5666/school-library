require_relative 'book'
require_relative 'persons'
require_relative 'students'
require_relative 'teachers'
require_relative 'rental'

class InputHandler
  def select_person_type
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    gets.chomp.to_i
  end

  def person_name
    print 'Name: '
    gets.chomp
  end

  def person_age
    print 'Age: '
    gets.chomp.to_i
  end

  def permission
    print 'Has parent permission? [Y/N]: '
    gets[0].capitalize == 'Y'
  end

  def student_classroom
    print 'What is the student\'s classroom? '
    gets.chomp
  end

  def teacher_specialization
    print 'Specialization: '
    gets.chomp
  end

  def book_title
    print 'Title: '
    gets.chomp
  end

  def book_author
    print 'Author: '
    gets.chomp
  end

  def select_book_index(books)
    puts 'Select a book from the following list by number'
    books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    gets.chomp.to_i
  end

  def select_person_index(people)
    puts 'Select a person from the following list by number (not ID)'
    people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    gets.chomp.to_i
  end

  def rental_date
    print 'Date: '
    gets.chomp
  end

  def collect_person_id
    print 'ID of person: '
    gets.chomp.to_i
  end
end