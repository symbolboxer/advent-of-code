# Day 2, part 2
# Sorry, I didn't think to save a copy of my solution to the first part before
# modifying it for the second part.

# Advent of Code rewards you for finishing FASTER
# That means some of this is UNOPTIMIZED and UNSAFE

strs = IO.readlines('input.txt')

hashes = strs.map {|s| s.split(' ') }.map { |t| { indices: t[0], char: t[1], pw: t[2] } }
puts 'Hashed:'
pp hashes
hashes.each do |h|
    h[:indices] = h[:indices].split('-').map { |n| n.to_i }
    h[:char] = h[:char][0]
end

num_valid = 0
hashes.each do |h|
    num_in_place = 0
    h[:indices].each { |i| num_in_place += 1 if h[:pw][i - 1] == h[:char] }
    num_valid += 1 if num_in_place == 1
end
pp num_valid
