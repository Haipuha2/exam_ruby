class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
End
person = Person.new("John Doe")
puts person.name
person.name = "Jane Doe"
puts person.name
