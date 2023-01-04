def score_to_grade(score)
  case score
  when (90..)
    'A'
  when (80..89)
    'B'
  when (70..79)
    'C'
  when (60..69)
    'D'
  when (0..60)
    'F'
  end
end

def get_grade(grade1, grade2, grade3)
  grades = [grade1, grade2, grade3]
  score_to_grade(grades.sum.to_f / grades.size)
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"