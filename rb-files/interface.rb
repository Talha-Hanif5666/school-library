class Interface
  def self.interface(interface, app) # rubocop:disable Metrics/CyclomaticComplexity
    case interface
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals_by_person_id
    when 7
      app.exit_program
    else
      puts 'Invalid option, please type correct number!'
    end
  end
end
