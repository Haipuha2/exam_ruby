class Car
  attr_accessor :make, :model, :year, :color

  def initialize(make, model, year, color)
    @make = make
    @model = model
    @year = year
    @color = color
  end

  def start
    puts "Engine starts"
  end

  def stop
    puts "Engine stops"
  end

  def turn_left
    puts "Turning left"
  end

  def turn_right
    puts "Turning right"
  end
end

class Sedan < Car
  attr_accessor :num_doors

  def initialize(make, model, year, color, num_doors)
    super(make, model, year, color)
    @num_doors = num_doors
  end

  def honk_horn
    puts "Beep!"
  end
end

class Truck < Car
  attr_accessor :payload

  def initialize(make, model, year, color, payload)
    super(make, model, year, color)
    @payload = payload
  end

  def tow_trailer
    puts "Towing trailer"
  end
end

sedan = Sedan.new("Toyota", "Camry", 2023, "white", 4)
truck = Truck.new("Ford", "F-150", 2022, "black", 2000)

sedan.start
sedan.honk_horn
truck.start
truck.tow_trailer