require_relative 'app'

def main
  app = App.new
  puts 'Welcome to School Library App!'
  loop do
    display_menu
    user_choice = gets.chomp.to_i
    handle_user_choice(user_choice, app)
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

def handle_user_choice(choice, app)
  menu_options = {
    1 => :list_books,
    2 => :list_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_by_person_id,
    7 => :exit_program
  }

  if menu_options.key?(choice)
    app.send(menu_options[choice])
  else
    puts 'That is not a valid option'
  end
end

def exit_program
  puts 'Thank you for using this app!'
  exit 0
end

loop { main }
