def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  return :invalid if angles.min <= 0 || angles.sum != 180
  case angles.max
  when (0...90) then :acute
  when 90       then :right
  else               :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
