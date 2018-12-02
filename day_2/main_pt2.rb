found = false
iter = 0
current = []

File.open("day_2/input.txt", "r") do |f|
  while !found do
    current = []

    f.each_with_index do |line, index|
      if index == iter
        current = line.split('')
      end

      if !current.empty?
        arr = line.split('')

        difference = {position: 0, diff: 0}

        current.each_with_index do |letter, index|

          if letter != arr[index]
            difference[:position] = index
            difference[:diff] = difference[:diff] + 1
          end

          if difference[:diff] > 1
            break
          end
        end

        if difference[:diff] == 1
          found = true
          current.delete_at(difference[:position])
          break
        end
      end
    end

    iter += 1

    if !found
      f.rewind
    end
  end
end

puts current.join('')
# answer zihwtxagifpbsnwleydukjmqv