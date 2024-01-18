#!/usr/bin/env ruby

require 'date'
require 'optparse'

year = Date.today.year
month = Date.today.month

opt = OptionParser.new
opt.on('-y [VAL]') {|y| year = y.to_i if y}
opt.on('-m [VAL]') {|m| month = m.to_i if m}
opt.parse!(ARGV)

first_day = Date.new(year, month)
last_day = Date.new(year, month, -1)

puts "#{first_day.month.to_s.rjust(7)}月 #{first_day.year.to_s}"
puts "日 月 火 水 木 金 土"
print " " * (3 * first_day.wday - 1) unless first_day.sunday?

(first_day..last_day).each do |date|
  day_string = date.day.to_s.rjust(date.sunday? ? 2 : 3)
  print day_string
  puts if date.saturday?
end
puts
