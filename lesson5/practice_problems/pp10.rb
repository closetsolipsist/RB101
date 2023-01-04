arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
p (arr.map do |hash|
  (hash.map { |k, v| [k, v + 1] }).to_h
end)

p (arr.map do |hash|
  new_hash = {}
  hash.each do |k, v|
    new_hash[k] = v + 1
  end
  new_hash
end)