# Day 5, part 2

# Advent of Code rewards you for finishing FASTER
# That means some of this is UNOPTIMIZED and UNSAFE


lines = IO.readlines('input.txt', chomp: true)

min_seat = 999
max_seat = 0
seats = []
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

    max_seat = [max_seat, seat_number].max
    min_seat = [min_seat, seat_number].min
    seats << seat_number
end

seats.sort!
next_seat = seats[0]
seats.each do |s|
    break unless s == next_seat
    next_seat += 1
end
puts "Missing seat #{next_seat}"
