total = 0;

File.open("day_1/input.txt", "r") do |f|
  f.each_line do |line|
    operation = line.slice!(0)

    if operation == "+"
      total += line.to_i
    elsif operation == "-"
      total -= line.to_i
    end
  end
end

puts total
# answer 569