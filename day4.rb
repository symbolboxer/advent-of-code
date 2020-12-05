# Day 4, part 2
# Sorry, I didn't think to save a copy of my solution to the first part before
# modifying it for the second part.

# Advent of Code rewards you for finishing FASTER
# That means some of this is UNOPTIMIZED and UNSAFE


require 'set'

class Passport

    def initialize
        @reqd_fields = Set.new(%w[byr iyr eyr hgt hcl ecl pid])
    end

    def process_field(key, value)
        puts "processing #{key}:#{value}"
        case key
        when 'byr'
            return unless value.to_i.between?(1920,2002)
        when 'iyr'
            return unless value.to_i.between?(2010,2020)
        when 'eyr'
            return unless value.to_i.between?(2020,2030)
        when 'hgt'
            if md = value.match(%r{^(?<number>\d+)(?<unit>(in)|(cm))$})
                pp md
                num = md[:number].to_i
                if md[:unit] == 'in'
                    return unless num.between?(59, 76)
                else
                    return unless num.between?(150,193)
                end
            else
                return
            end
        when 'hcl'
            return unless value.match(/^#[0-9a-f]{6}$/)
        when 'ecl'
            return unless %w[amb blu brn gry grn hzl oth].include?(value)
        when 'pid'
            return unless value.match(/^\d{9}$/)
        else
            return
        end
        puts 'valid'
        @reqd_fields.delete(key)
    end

    def valid?
        @reqd_fields.empty?
    end
end

lines = IO.readlines('input.txt', chomp: true)

valid_passports=0
current = Passport.new
lines.each do |l|
    puts "processing #{l}"
    if l == ''
        puts "is an empty line"
        valid_passports += 1 if current.valid?
        current = Passport.new
    else
        puts "has data"
        pairs = l.split(' ').map{|p| p.split(':')}
        puts "pairs: #{pairs}"
        pairs.each {|p| current.process_field(*p)}
    end
end
valid_passports += 1 if current.valid?

puts valid_passports
