def after_midnight(time)
  hour, minute = time.split(':').map(&:to_i)
  (hour * 60 + minute) % (24 * 60)
end

def before_midnight(time)
  minutes_after_midnight = after_midnight(time)
  minutes_after_midnight == 0 ? 0 : (24 * 60) - minutes_after_midnight
end

def after_midnight_alt(time)
  hour, minute = time.split(':').map(&:to_i)
  time = Time.new(1, 1, 1, hour, minute, 0)
  midnight = Time.new(1, 1, 1, 0, 0, 0)
 ((time - midnight) / 60) % (60 * 24)
end

def before_midnight_alt(time)
  hour, minute = time.split(':').map(&:to_i)
  time = Time.new(1, 1, 1, hour, minute, 0)
  midnight = Time.new(1, 1, 2, 0, 0, 0)
  ((midnight - time) / 60) % (60 * 24)
end

p after_midnight_alt('00:00') == 0
p before_midnight_alt('00:00') == 0
p after_midnight_alt('12:34') == 754
p before_midnight_alt('12:34') == 686
p after_midnight_alt('24:00') == 0
p before_midnight_alt('24:00') == 0
