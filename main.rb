require './person'
require './student'
require './teacher'
require './book'
require './rental'

class Ui
  def initialize
    @books = []
    @people = []
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
end
