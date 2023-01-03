flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones.each_with_index {|item,index| flintstones[index] = [item, index]}
flintstones = flintstones.to_h
p flintstones