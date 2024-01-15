#!/usr/bin/env ruby

def fizz_buzz(num, fizz_num, buzz_num)
  fizz = num % fizz_num == 0
  buzz = num % buzz_num == 0
  if fizz && buzz
    "FizzBuzz"
  elsif fizz
    "Fizz"
  elsif buzz
    "Buzz"
  else 
    num
  end
end

fizz_num = 3
buzz_num = 5
repeat_num = 20

(1..repeat_num).each { |num| puts fizz_buzz(num, fizz_num, buzz_num) }
