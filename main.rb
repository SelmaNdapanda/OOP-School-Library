require_relative 'app'

def main
  app = App.new
  app.start
end

def option(input)
  case input
  when '1'
    list_books
  when '2'
    list_people
  when '3'
    create_person
  when '4'
    create_book
  when '5'
    create_rental
  when '6'
    list_rentals_for_person_id
  else
    exit_app(app)
  end
end

def exit_app(_app)
  puts 'Thank you for using this app!'
  exit
end

main
