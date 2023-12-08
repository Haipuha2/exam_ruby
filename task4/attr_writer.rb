class Person
  attr_writer :age

  def initialize(name, age)
    @name = name
    @age = age
  end
End
person = Person.new("John Doe", 20)
person.age = 30
