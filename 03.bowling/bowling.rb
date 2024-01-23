#!/usr/bin/env ruby

# frozen_string_literal: true

STRIKE_SCORE = 10
LAST_FRAMES = 10

score = ARGV[0]
scores = score.split(',')
shots = []

shots = scores.map {|s| s == 'X' ?10 : s.to_i }

point = 0
is_first_shot = true
frame_num = 1
shots.each_with_index do |shot, i|
  if frame_num == LAST_FRAMES
    point += shot
  elsif shot == STRIKE_SCORE && is_first_shot # strike
    point += shots.slice(i..i + 2).sum
    frame_num += 1
  else
    point += shot
    if !is_first_shot
      point += shots[i + 1] if shots.slice(i - 1..i).sum == STRIKE_SCORE # spare
      frame_num += 1
    end
    is_first_shot = !is_first_shot
  end
end
puts point
