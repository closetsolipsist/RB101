def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  return :invalid if sides.min <= 0
  longest_side = sides.max
  return :invalid if sides.sum <= 2 * longest_side
  case sides.uniq.size
  when 1 then return :equilateral
  when 2 then return :isosceles
  when 3 then return :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid