=begin
PEDAC

Problem:
Given minutes after midnight, return time in 24 hour format

Input: signed integer
Output: string representing time

Requirements:
Explicit
  - Negative integer inputs represent times before midnight
  - 24 hour format, hh:mm
Implicit
  - Midnight is represented as 00:00, not 24:00
  - 3:00 is written like 03:00, i.e. we need a leading zero when
    the length of the the hour or minute is 1

Examples:
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

Data Structure: integers to represent hour and minute

Algorithm:

Normalize input `time` by modding by 24 * 60.
set hour to `time / 60` (integer division)
set minute to `time modulo 60`
convert hour to string and pad it with 0's so its length is 2
convert minute to string and pad it with 0's so its length is 2
return hour concatenated with ":" concatenated with minute
=end

def time_of_day(minutes_after_midnight)
  minutes_after_midnight %= (24 * 60)
  hour = minutes_after_midnight / 60
  minute = minutes_after_midnight % 60
  hour_string = hour.to_s.rjust(2, '0')
  minute_string = minute.to_s.rjust(2, '0')
  "#{hour_string}:#{minute_string}"
end

def alt_time_of_day(minutes_after_midnight)
  midnight = Time.new(2023, 1, 8, 0, 0, 0)
  new_time = midnight + minutes_after_midnight * 60
  new_time.to_s.split(' ')[1][0..4]
end

def alt_time_of_day_with_weekday(minutes_after_midnight)
  weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday",
              "Thursday", "Friday", "Saturday"]
  midnight = Time.new(2023, 1, 8, 0, 0, 0)
  new_time = midnight + minutes_after_midnight * 60
  weekday = weekdays[new_time.wday]
  hhmm = new_time.to_s.split(' ')[1][0..4]
  "#{weekday} #{hhmm}"
end

p alt_time_of_day_with_weekday(-4231) == "Thursday 01:29"
p alt_time_of_day(0) == "00:00"
p alt_time_of_day(-3) == "23:57"
p alt_time_of_day(35) == "00:35"
p alt_time_of_day(-1437) == "00:03"
p alt_time_of_day(3000) == "02:00"
p alt_time_of_day(800) == "13:20"
p alt_time_of_day(-4231) == "01:29"