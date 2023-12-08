# Елемент - абстрактний клас або інтерфейс
class LogEntry
  def accept(visitor)
    raise NotImplementedError, "This method should be overridden by subclasses"
  end
end

# Конкретний елемент - запис логу про подію
class EventLogEntry < LogEntry
  attr_reader :event_name, :timestamp

  def initialize(event_name, timestamp)
    @event_name = event_name
    @timestamp = timestamp
  end

  def accept(visitor)
    visitor.visit_event_log_entry(self)
  end
end

# Конкретний елемент - запис логу про помилку
class ErrorLogEntry < LogEntry
  attr_reader :error_message, :timestamp

  def initialize(error_message, timestamp)
    @error_message = error_message
    @timestamp = timestamp
  end

  def accept(visitor)
    visitor.visit_error_log_entry(self)
  end
end

# Відвідувач - інтерфейс або абстрактний клас
class LogVisitor
  def visit_event_log_entry(entry)
    raise NotImplementedError, "This method should be overridden by subclasses"
  end

  def visit_error_log_entry(entry)
    raise NotImplementedError, "This method should be overridden by subclasses"
  end
end

# Конкретний відвідувач - аналізує логи та виводить результат
class LogAnalyzer < LogVisitor
  def initialize
    @event_count = 0
    @error_count = 0
  end

  def visit_event_log_entry(entry)
    @event_count += 1
    puts "Event logged at #{entry.timestamp}: #{entry.event_name}"
  end

  def visit_error_log_entry(entry)
    @error_count += 1
    puts "Error logged at #{entry.timestamp}: #{entry.error_message}"
  end

  def display_summary
    puts "Summary: #{@event_count} events, #{@error_count} errors"
  end
end

# Використання паттерну
log_entries = [
  EventLogEntry.new("User login", Time.now),
  ErrorLogEntry.new("Server error: 500", Time.now + 60),
  EventLogEntry.new("File uploaded", Time.now + 120),
  ErrorLogEntry.new("Database connection failed", Time.now + 180)
]

log_analyzer = LogAnalyzer.new

log_entries.each { |entry| entry.accept(log_analyzer) }

log_analyzer.display_summary
