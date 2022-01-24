class Person

  attr_reader :id
  attr_accessor :name
  attr_accessor :age

  def initialize(name = "Unknown", age, parent_permission = true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission

  end

  def is_of_age?
    if @age >= 18
      true
    else
      false
    end
  end
  private :is_of_age?

  def can_use_services?
    is_of_age? || @parent_permission == true
  end


end