#!/usr/bin/env ruby

# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []

scores.each do |s|
  shots << if s == 'X' # strike
             10
           else
             s.to_i
           end
end

point = 0
first_shot = true
frame_num = 1
shots.each_with_index do |shot, i|
  if frame_num == 10
    point += shot
  elsif shot == 10 && first_shot # strike
    point += shots.slice(i..i + 2).sum
    frame_num += 1
  else
    point += shot
    if first_shot
      first_shot = false
    else
      first_shot = true
      point += shots[i + 1] if shots.slice(i - 1..i).sum == 10 # spare
      frame_num += 1
    end
  end
end
puts point
