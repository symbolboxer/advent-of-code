# Day 1, part 2
# Sorry, I didn't think to save a copy of my solution to the first part before
# modifying it for the second part.

# Advent of Code rewards you for finishing FASTER
# That means some of this is UNOPTIMIZED and UNSAFE

puts 'entered'
strs = IO.readlines('input.txt')

nums = strs.map {|s| s.to_i}

products = []
nums.each_with_index do |outer, idx|
    paired = nil
    mid_rem = nums[idx + 1..-1]
    mid_rem.each_with_index do |mid, midx|
        inner_rem = mid_rem[midx + 1..-1]
        inner_rem.each do |inner|
            if outer + mid + inner == 2020
                products << outer * mid * inner
                break if products.length == 3
            end
        end
        break if products.length == 3
    end
    break if products.length == 3
end

puts products
