require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

def list_books
  puts 'List of books:'
  @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
end

def list_people
  puts 'List of people:'
  @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
end

# rubocop:disable Metrics/MethodLength
def create_person
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  person_type = gets.chomp

  if person_type != '1' && person_type != '2'
    puts 'Invalid option'
    return
  end

  print 'Age: '
  age = gets.chomp

  print 'Name: '
  name = gets.chomp

  case person_type
  when '1'
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    parent_permission = parent_permission.downcase == 'y'

    person = Student.new(age, name: name, parent_permission: parent_permission)

  when '2'
    print 'Specialization: '
    specialization = gets.chomp

    person = Teacher.new(age, specialization: specialization, name: name)
  end

  @people << person

  puts 'Person created successfully'
end
# rubocop:enable Metrics/MethodLength

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
  @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
  book_index = gets.chomp.to_i

  puts

  puts 'Select a person from the following list by number (not id)'
  # rubocop:disable Metrics/LineLength
  @people.each_with_index { |person, index| puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  person_index = gets.chomp.to_i
  # rubocop:enable Metrics/LineLength

  puts

  print 'Date: '
  date = gets.chomp

  @rentals << Rental.new(date, @books[book_index], @people[person_index])
  puts 'Rental created successfully'
end

def list_rentals_for_person_id
  print 'ID of person: '
  id = gets.chomp.to_i

  puts 'Rentals:'
  @rentals.each do |rental|
    puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
  end
end

# rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
def main
  @books = []
  @people = []
  @rentals = []

  puts ''
  puts 'Welcome to School Library App'
  puts ''

  option = nil

  while option != '7'
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    option = gets.chomp

    case option
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
    end

    puts
  end

  puts 'Thank you for using this app!'
end
# rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity

main
