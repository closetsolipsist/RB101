(1..99).each do |n|
  puts n if n.odd?
end

(1..99).to_a.select(&:odd?).each {|n| puts n}