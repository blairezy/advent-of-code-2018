#Hi, I'm trash code. Please stop.

require 'set'

@coordinates = Set.new()
@overlapping_coordinates = Set.new()
@all_coordinates_added = false
@unique_claim = ''

def add_coordinate(arr, w, h, id)
  y = 0
  any_overlap = false

  while y < h do
    x = 0
    while x < w do
      coor = [(arr[0] + x), (arr[1]+y)]
      if !@all_coordinates_added
        if @coordinates.add?(coor).nil?
            @overlapping_coordinates.add(coor)
        end
      elsif @overlapping_coordinates.include?(coor)
        any_overlap = true
      end
      x += 1
    end
    y += 1
  end

  if @all_coordinates_added && !any_overlap
    @unique_claim = id
  end
end

File.open("day_3/input.txt", "r") do |f|
  while @unique_claim.empty? do
    f.each_line do |line|
      values = line.split(/[@,:x]/)
      origin = [values[1].strip.to_i, values[2].strip.to_i]
      id = values[0].strip.tr('#', '')

      add_coordinate(origin, values[3].strip.to_i, values[4].strip.to_i, id)

      if !@unique_claim.empty?
        break
      end
    end

    @all_coordinates_added = true

    if @unique_claim.empty?
      f.rewind
    end
  end
end

puts @unique_claim
# answer 1178

