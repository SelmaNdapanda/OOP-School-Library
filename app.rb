require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'user_input'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    books.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
  end

  def list_people
    people.each_with_index { |person, index| puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  # rubocop:disable Metrics/MethodLength
  def create_person
    age, name, choice = grab_person_data

    case choice
    when 1
      permission = grab_permission
      student = Student.new(age, name: name, parent_permission: permission)
      people << student
      puts 'Person created successfully'
    when 2
      specialization = grab_specialization
      teacher = Teacher.new(age, name: name, specialization: specialization)
      people << teacher
      puts 'Person created successfully'
    else
      puts 'Invalid option'
    end
  end

  def create_book
    title, author = grab_book_data
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book = books[grab_book_input]
    puts 'Select a person from the following list by number (not id)'
    list_people
    person = people[grab_person_input]
    puts 'Date:'
    date = grab_date
    rental = Rental.new(book, person, date)
    @rentals << rental
    puts 'rental created successfully'
  end

  def list_rentals_for_person_id
    id = grab_person_id
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
  end
end
