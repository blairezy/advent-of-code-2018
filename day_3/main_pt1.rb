require 'set'

@coordinates = Set.new()
@overlapping_coordinates = Set.new()

def add_coordinate(arr, w, h)
  y = 0
  while y < h do
    x = 0
    while x < w do
      coor = [(arr[0] + x), (arr[1]+y)]
      if @coordinates.add?(coor).nil?
        @overlapping_coordinates.add(coor)
      end
      x += 1
    end
    y += 1
  end
end

File.open("day_3/input.txt", "r") do |f|
  f.each_with_index do |line, index|
    values = line.split(/[@,:x]/)
    origin = [values[1].strip.to_i, values[2].strip.to_i]
    add_coordinate(origin, values[3].strip.to_i, values[4].strip.to_i)
  end
end

puts @overlapping_coordinates.size
# answer 118322