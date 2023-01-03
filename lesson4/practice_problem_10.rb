munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def age_group(age)
  case
  when 0..17
    "kid"
  when 18..64
    "adult"
  when 65..
    "senior"
  end
end

munsters.each do |name, traits|
  age = traits["age"]
  traits["age_group"] = age_group(age)
end

p munsters