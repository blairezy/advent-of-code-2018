total_doubles = 0
total_triples = 0

def isTriple(input)
  !input.sort.chunk{ |e| e }.select { |e, chunk| chunk.size == 3 }.map(&:first).empty?
end

def isDouble(input)
  !input.sort.chunk{ |e| e }.select { |e, chunk| chunk.size == 2 }.map(&:first).empty?
end

File.open("day_2/input.txt", "r") do |f|
  f.each_line do |line|

    arr = line.split('')
    if isTriple(arr)
      total_triples += 1
    end
    if isDouble(arr)
      total_doubles += 1
    end
  end
end

puts (total_doubles * total_triples)
# answer 8892