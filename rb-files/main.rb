require_relative './app'
require_relative './interface'

def list_interfaces
  "Please choose an option by entering a number:
    1 - List of all books
    2 - List of all people
    3 - Add a person
    4 - Create a book
    5 - Add a rental
    6 - List of all rental for given id
    7 - Exit"
end

def intro
  "Welcome to School Library App!\n\n"
end

def main
  app = App.new

  puts intro

  loop do
    puts list_interfaces
    interface = gets.chomp.to_i
    Interface.interface(interface, app)
  end
end
main
