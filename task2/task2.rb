# Створення символу
hello = :hello

# Порівняння символів
if hello == :hello
  puts "Символи рівні"
end

# Використання символу як ключа в хеш-таблиці
my_hash = { hello: "world" }
puts my_hash[:hello] # Виведе "world"