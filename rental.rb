class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, _person)
    @date = date
    @book = book
    @book.rentals << self

    @person = book
    @person.rentals << self
  end
end
