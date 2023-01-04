arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
resulting_hash = arr.each_with_object({}) do |sub_arr, hash|
  key = sub_arr[0]
  value = sub_arr[1]
  hash[key] = value
end
p resulting_hash
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}