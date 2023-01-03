DEGREE = "\xC2\xB0"
def dms(angle)
  angle = angle.to_s.to_r
  degrees = angle.floor
  angle -= degrees
  angle *= 60
  minutes = angle.floor
  angle -= minutes
  angle *= 60
  seconds = angle.floor
  degrees_string = (degrees % 360).to_s
  minutes_string = format("%02d", minutes.to_s)
  seconds_string = format("%02d", seconds.to_s)
  "#{degrees_string}#{DEGREE}#{minutes_string}'#{seconds_string}\""
end
p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")