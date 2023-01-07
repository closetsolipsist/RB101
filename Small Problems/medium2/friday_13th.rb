require 'date'

def friday_13th(year)
  thirteenths = (1..12).to_a.map { |month| Date.new(year, month, 13) }
  thirteenths.count { |day| day.friday? }
end

def leapyear?(year)
  return false unless year % 4 == 0
  return true unless year % 100 == 0
  return false unless year % 400 == 0
  true
end

def five_fridays_count(year)
  days_per_month = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  days_per_month[2] += 1 if leapyear?(year)
  (1..12).count do |month|
    first_day_of_week = Date.new(year, month, 1).wday
    first_friday = 1 + (5 - first_day_of_week) % 7
    (days_per_month[month] - first_friday) / 7 >= 4
  end
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
p five_fridays_count(2023)