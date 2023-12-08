class Product
  def initialize(name, price)
    @name = name
    @price = price
  end

  def calculate_price
    raise NotImplementedError
  end
end

class Book < Product
  def calculate_price
    @price * 1.2
  end
end

class Food < Product
  def calculate_price
    @price * 1.5
  end

class Clothing < Product
  def calculate_price
    @price * 2.0
  end

book = Book.new("Harry Potter", 100)
food = Food.new("Apple", 50)
clothing = Clothing.new("T-shirt", 20)

puts book.calculate_price
puts food.calculate_price
puts clothing.calculate_price