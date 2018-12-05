require 'date'

@events = []
@guards = []

def read_input()
  File.open("day_4/input.txt", "r") do |f|
    f.each_with_index do |line, index|
      @events << line
    end
  end
end

def sort_events()
  @events = @events.sort_by {|line|
    date = line.split(/[\[\]]/)[1].strip
    DateTime.parse(date).strftime('%Y-%m-%d %H:%M')}
end

def get_id(event)
  start_index = event.index('#') + 1
  end_index = event[start_index..-1].index(' ')
  id = event[start_index, end_index].strip
  id
end

def assign_guards()
  @events.each do |event|
    if event.include?('#')
      id = get_id(event)

      if !@guards.any? {|guard| guard.id == id}
        guard = Guard.new(id)
        @guards << guard
      end
    end
  end
end

def get_minute(event)
  time = event.tr('[]', '').split(' ')[1]
  minute = time.split(':')[1]
end

def add_minutes(id, asleep, awake)
  guard = @guards.find{ |guard| guard.id == id }
  count = (awake - asleep)

  min = asleep

  count.times do
    guard.minutes_asleep << min
    min += 1
  end
end

def calculate_sleep_times()
  guard_id = ''
  sleep_minute = ''
  wake_minute = ''

  @events.each_with_index do |event, index|
    if event.include?('#')
      guard_id = get_id(event)
    elsif event.include?('sleep')
      sleep_minute = get_minute(event)
    elsif event.include?('wake')
      wake_minute = get_minute(event)
    end

    if !sleep_minute.empty? && !wake_minute.empty?
      add_minutes(guard_id, sleep_minute.to_i, wake_minute.to_i)
      sleep_minute = ''
      wake_minute = ''
    end
  end
end

def get_laziest_guard()
  guard = @guards.max_by(&:sleep_time)
end

def get_popular_sleep_minute(id)
  guard = @guards.find{ |guard| guard.id == id }
  freq = Hash.new(0)
  guard.minutes_asleep.each { |x| freq[x] += 1 }
  minute_frequency = freq.max_by{|k,v| v}
  minute_frequency[0]
end

class Guard
  def initialize(id)
    @id = id
    @minutes_asleep = []
  end

  def id
    @id
  end

  def minutes_asleep
    @minutes_asleep
  end

  def sleep_time
    @minutes_asleep.size
  end
end

read_input()
sort_events()
assign_guards()
calculate_sleep_times()
lazy_guard = get_laziest_guard()
minute = get_popular_sleep_minute(lazy_guard.id)

puts "guard id: " + lazy_guard.id + " best sleep minute: " + minute.to_s
puts (lazy_guard.id.to_i*minute)
#answer 104764