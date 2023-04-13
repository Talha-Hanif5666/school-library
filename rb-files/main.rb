require_relative 'app'
APP = App.new
def main
  loop do
    display_menu
    user_choice = gets.chomp.to_i
    handle_user_choice(user_choice)
  end
rescue Interrupt
  warn "\nProgram exited"
  exit 130
end

def display_menu
  puts "\nPlease choose an option by entering a number:"
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

def handle_user_choice(choice)
  case choice
  when 1
    APP.list_books
  when 2
    APP.list_people
  when 3
    APP.create_person
  when 4
    APP.create_book
  when 5
    APP.create_rental
  when 6
    APP.list_rentals_by_person_id
  when 7
    puts 'Thank you for using this app!'
    exit 0
  else
    puts 'That is not a valid option'
  end
end

puts 'Welcome to School Library App!'
loop { main }
