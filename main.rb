require './person'
require './student'
require './teacher'
require './book'
require './rental'

class Ui
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def person
    puts 'Do you want to create a student (1) or a teacher (2) ?'
    option = Integer(gets.chomp)

    case option
    when 1
      print 'Age: '
      age = Integer(gets.chomp)

      print 'Name: '
      name = gets.chomp

      print 'Has parent(s) permission? [Y/N]: '
      users_parent_permission = gets.chomp

      case users_parent_permission
      when 'y'
        users_parent_permission = true

      when 'n'
        users_parent_permission = false
      end
      student = Student.new(age, name, parent_permission: users_parent_permission)

      @people.push({
                     output: "[Student] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}",
                     object: student
                   })
      puts 'Student created Successfully !'

    when 2
      print 'Age: '
      age = Integer(gets.chomp)

      print 'Name: '
      name = gets.chomp

      print 'Specialization: '
      specialization = gets.chomp

      teacher = Teacher.new(age, name, specialization)

      @people.push({
                     output: "[Teacher] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}",
                     object: teacher
                   })
      puts 'Teacher created Successfully !'
    else
      puts 'Wrong option'
    end
  end

  def create_book
    print 'Title: '
    book_title = gets.chomp

    print 'Author: '
    book_author = gets.chomp

    book = Book.new(book_title, book_author)

    @books.push({
                  output: "[Book] Title: #{book.title}, Author: #{book.author}",
                  object: book
                })
    puts 'Book created successfully'
  end

  def list_books
    @books.each do |book|
      puts book[:output]
    end
  end

  def list_people
    @people.each do |person|
      puts person[:output]
    end
  end

  def create_rentals
    puts 'Select a book from the following list by number you want to rent'

    @books.each_with_index do |book, index|
      puts "#{index + 1} - #{book[:output]}"
    end

    book_number = Integer(gets.chomp)
    book_selected = @books[book_number - 1][:object]

    puts 'Select a person from the following list by number (not by id)'

    @people.each_with_index do |person, index|
      puts "#{index + 1} - #{person[:output]}"
    end

    person_number = Integer(gets.chomp)
    person_selected = @people[person_number - 1][:object]

    print 'Date: '
    rental_date = gets.chomp

    @rentals.push(Rental.new(rental_date, book_selected, person_selected))

    puts 'Rental successfully created !'
  end

  def rentals_list
    print 'Id of person: '

    person_id = Integer(gets.chomp)

    puts 'rentals: '

    @rentals.each do |rental|
      next unless rental.person.id == person_id

      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end

class ListOfOptions
  def self.page_for_options
    puts 'Please choose an option by entering a number:'
    option1 = '1 - List all books'
    option2 = '2 - List all people'
    option3 = '3 - Create a person'
    option4 = '4 - Create a book'
    option5 = '5 - Create a rental'
    option6 = '6 - List all rentals for a given person id'
    option7 = '7 - Exit'
    questions_arr = [option1, option2, option3, option4, option5, option6, option7]
    questions_arr.each do |question|
      puts question
    end
    Integer(gets.chomp)
  end

  ui = Ui.new

  loop do
    case page_for_options
    when 1
      ui.list_books
    when 2
      ui.list_people
    when 3
      ui.person
    when 4
      ui.create_book
    when 5
      ui.create_rentals
    when 6
      ui.rentals_list
    when 7
      puts 'Goodbye!'
      exit
    end
  end
end

def main
  showUi
end

main
