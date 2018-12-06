def read_input()
  content = ''
  File.open("day_5/input.txt", "r") do |f|
    f.each_line do |line|
      content += line
    end
  end
  content
end

def opposing_polarity?(a, b)
  (a.upcase == a && a.downcase == b) || (a.downcase == a && a.upcase == b)
end

def react(input)
  initial = input.split('')
  accumulator = []

  changed = true

  while changed do
    index = 0

    while index < initial.length do
      a = initial[index]
      b = initial[index + 1]

      if opposing_polarity?(a, b)
        index += 2
      else
        accumulator << a
        index += 1
      end
    end

    if initial.length == accumulator.length
      changed = false
    else
      initial = accumulator
      accumulator = []
    end
  end
  accumulator
end

polymer = read_input()

result = react(polymer)

puts result.length
# answer 9116
