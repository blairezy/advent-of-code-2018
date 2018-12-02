require 'set'

total = 0
frequencies = Set.new([0])
found = false

File.open("day_1/input.txt", "r") do |f|
  while !found do
    f.each_line do |line|
      operation = line.slice!(0)

      if operation == "+"
        total += line.to_i
      elsif operation == "-"
        total -= line.to_i
      end

      if frequencies.member?(total)
        found = true
        break
      else
        frequencies = frequencies.add(total)
      end
    end

    if !found
      f.rewind
    end
  end
end

puts total
#answer 77666