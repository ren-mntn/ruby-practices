#!/usr/bin/env ruby

require 'date'
require 'optparse'

year = Date.today.year
month = Date.today.month

opt = OptionParser.new
opt.on('-y [VAL]') {|y| year = y.to_i if y}
opt.on('-m [VAL]') {|m| month = y.to_i if m}
opt.parse!(ARGV)

first_day = Date.new(year, month)
last_day = Date.new(year, month, -1)

puts "#{first_day.month.to_s.rjust(7)}月 #{first_day.year.to_s}"
puts "日 月 火 水 木 金 土"
print " " * (3 * first_day.wday - 1) unless first_day.sunday?

(first_day..last_day).each do |date|
  day_string = first_day.day.to_s.rjust(first_day.sunday? ? 2 : 3)
  if  first_day.saturday?
    puts day_string
  else
    print day_string
  end
  first_day += 1
end
puts
