require './app'
class Menu
  def initialize(app)
    @app = app
  end

  def welcome
    puts "Welcome to school library app!\n\n"
  end

  def menu
    puts
    puts 'Please choose an option by entering a number'
    @list = {
      1 => 'List all books',
      2 => 'List all people',
      3 => 'Create a person',
      4 => 'Create a book',
      5 => 'Create a rental',
      6 => 'List all rentals for a given person id',
      7 => 'Exit'
    }
    @list.each do |id, option|
      puts "#{id}: #{option}"
    end
  end

  def user_input
    input = gets.chomp
    input_is_valid?(input)
  end

  def input_is_valid?(input)
    if %w[1 2 3 4 5 6 7].include?(input)
      selected_option input
    else
      puts "#{input} isn't in the list! Try again"
      menu
    end
  end

  def selected_option(input)
    case input.to_i
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rental_of_person
    when 7
      puts 'Thank you for using this app!'
      exit
    else
      puts 'Please choose a number between 1 and 7'
    end
  end

  def start
    welcome
    loop do
      menu
      user_input
    end
  end
end
