#!/usr/bin/env ruby
require 'date'
require 'optparse'

year = Date.today.year
month = Date.today.month

opt = OptionParser.new

opt.on('-y [VAL]') {|y|
if y 
  year = y.to_i
end
}

opt.on('-m [VAL]') {|m|
if m 
  month = m.to_i
end
}

opt.parse!(ARGV)

calendar = Date.new(year, month)

puts "#{calendar.month.to_s.rjust(7)}月 #{calendar.year.to_s}"
puts "日 月 火 水 木 金 土"

if calendar.strftime('%a') != "Sun"
    print  " " * (3 * calendar.wday - 1)
end 

while calendar.month == month
  day_string = calendar.day.to_s.rjust(calendar.sunday? ? 2 : 3)
  if  calendar.strftime('%a') == "Sat"
    puts day_string
  else
    print day_string
  end
  calendar += 1
end
puts
