require './corrector'
require './rental'

class Person
  attr_reader :id
  attr_accessor :name, :age, :parent_permission, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..10)
    @name = name
    @age = age
    @corrector = Corrector.new
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission == true
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  private :of_age?
end
