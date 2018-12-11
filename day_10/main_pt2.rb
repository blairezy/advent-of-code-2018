
class Point
  def initialize(id, x, y, a, b)
    @id = id
    @x = x
    @y = y
    @a = a
    @b = b
  end

  def id 
    @id
  end

  def x 
    @x
  end

  def y
    @y
  end

  def a 
    @a 
  end

  def b 
    @b
  end

  def velocity
    [@a, @b]
  end
end

def read_input()
  File.read("day_10/input.txt").strip().split("\n")
end

def extract_position(line)
  character = ">"
  property = "position="
  end_index = line.index(character)
  velocity = line[0..end_index]
  values = velocity.gsub(property, "").tr("<>", "").split(", ")
end

def extract_velocity(line)
  property = "velocity="
  start_index = line.index(property)
  velocity = line[start_index..-1]
  values = velocity.gsub(property, "").tr("<>", "").split(", ")
end

def calculate_point_with_velocity(value, velocity, time)
  (time * velocity) + value

end

def all_points(input)
  all_points = []
  input.each_with_index do |line, index|
    a, b = extract_velocity(line)
    x, y = extract_position(line)
    all_points << create_point(index, x.to_i, y.to_i, a.to_i, b.to_i)
  end
  all_points
end

def run(input) 
  all_points = all_points(input) 
  time = 10813
  all_points.each { | point | 
    puts "point: " + [calculate_point_with_velocity(point.x, point.a, time), calculate_point_with_velocity(point.y, point.b, time)].join(', ')
    puts "vel: " + [ point.a, point.b].join(', ')
  }
  (100..200).each { | y |
    line = ''
    (100..300).each { | x |
      
      match = all_points.find { | point | 
        calculate_point_with_velocity(point.x, point.a, time) == x && 
        calculate_point_with_velocity(point.y, point.b, time) == y
      }
      
      if match.nil?
        line += '.'
      else
        line += '#'
      end
    }
    puts line
  }
end

def create_point(id, *args)
  Point.new(id, *args)
end

input = read_input()
run(input)

#answer 10813