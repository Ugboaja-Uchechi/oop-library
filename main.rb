require './person'
require './student'
require './teacher'
require './book'
require './rental'

class Ui
  def initialize
    @books = []
  end

  def list_books
    @books.push do |book|
      puts book [:output]
    end
  end
end
