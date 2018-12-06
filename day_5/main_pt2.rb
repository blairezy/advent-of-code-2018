def read_input()
  content = ''
  File.open("day_5/input.txt", "r") do |f|
    f.each_line do |line|
      content += line
    end
  end
  content.strip()
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

def remove_units(polymer, unit)
  polymer_copy = polymer.dup
  polymer_copy.tr!(unit.upcase, '')
  polymer_copy.tr!(unit.downcase, '')
  polymer_copy
end

def generate_polymer_reduction_hash(polymer)
  reductions = Hash.new{0}
  ("a".."z").each { |letter|
    stripped_polymer = remove_units(polymer, letter)
    result = react(stripped_polymer)
    reductions[letter] = result.size
  }
  reductions
end

def shortest_polymer(reductions)
  value = reductions.min_by{|k, v| v}
end

polymer = read_input()
polymer_hash = generate_polymer_reduction_hash(polymer)

puts shortest_polymer(polymer_hash)

#answer {"s" => 6890}


