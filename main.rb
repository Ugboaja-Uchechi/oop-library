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
