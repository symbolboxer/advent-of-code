# Day 3, part 2
# Sorry, I didn't think to save a copy of my solution to the first part before
# modifying it for the second part.

# Advent of Code rewards you for finishing FASTER
# That means some of this is UNOPTIMIZED and UNSAFE


strs = IO.readlines('input.txt')


# jumps = [1, 3, 5, 7]
# jumps.each do |inc|
    trees_encountered = 0
    x_loc = 0
    strs.each_with_index do |row, index|
        next if index % 2 == 1
        trees_encountered += 1 if row[x_loc] == '#'
        x_loc = ((x_loc + 1) % 31)
    end
    puts trees_encountered
# end
