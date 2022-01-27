require './person'
require './student'
require './teacher'
require './book'
require './rental'

class Ui
  def initialize
    @books = []
    @people = []
    @rental = []
  end

  def person
    puts 'Do you want to create a student (1) or a teacher (2) ?'
    option = Integer(gets.chomp)

    case option
    when 1
      print 'Age: '
      users_age = Integer(gets.chomp)

      print 'Name: '
      users_name = gets.chomp

      print 'Has parent(s) permission? [Y/N]: '
      users_parent_permission = gets.chomp

      case users_parent_permission
      when 'y'
        users_parent_permission = true

      when 'n'
        users_parent_permission = false
      end
      student = Student.new(users_age, users_name, parent_permission: users_parent_permission)

      @people.push({
        output: "[Student] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}",
        object: student
      })
      puts 'Student created Successfully !'

    when 2
      print 'Age: '
      users_age = Integer(gets.chomp)

      print 'Name: '
      users_name = gets.chomp

      print 'Specialization: '
      users_specialization = gets.chomp

      teacher = Teacher.new(users_age, users_name, users_specialization)

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
    @books.push do |book|
      puts book [:output]
    end
  end

  def list_people
    @people.push do |person|
      puts person [:output]
    end
  end

  def create_rentals
    puts 'Select a book from the following list by number you want to rent'

    @books.each_with_index do |book, index|
      puts "#{index + 1} - #{book[:output]}"
    end

    book_number = Integer(gets.chomp)
    book_selected = @books[book_number - 1][:object]

    puts 'Select a person from the following list by number'

    @people.each_with_index do |person, index|
      puts "#{index + 1} - #{person[:output]}"
    end

    person_number = Integer(gets.chomp)
    person_selected = @people[person_number - 1][:object]

    print 'Date: '
    rental_date = Integer(gets.chomp)

    @rental.push(Rental.new(rental_date, book_selected, person_selected))

    puts 'Rental successfully created !'
  end
end
