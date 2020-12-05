# Day 5, part 1

# Advent of Code rewards you for finishing FASTER
# That means some of this is UNOPTIMIZED and UNSAFE


lines = IO.readlines('input.txt', chomp: true)

max_total = 0
lines.each do |l|
    puts "processing #{l}"
    row_hints = l[0,7]
    col_hints = l[7..-1]

    row_min = 0
    row_max = 127
    row_hints.each_char do |rh|
        midpoint = (row_min + row_max) / 2
        if rh == 'B'
            row_min = midpoint + 1
        else
            row_max = midpoint
        end
    end
    puts "min row: #{row_min} max row: #{row_max}"
    raise unless row_min == row_max

    col_min = 0
    col_max = 7
    col_hints.each_char do |ch|
        midpoint = (col_max + col_min) / 2
        if ch == 'R'
            col_min = midpoint + 1
        else
            col_max = midpoint
        end
    end
    puts "min col: #{col_min} max col: #{col_max}"
    raise unless col_min == col_max

    seat_number = (row_max * 8) + col_max

    max_total = [max_total, seat_number].max
end

puts "Max: #{max_total}"
