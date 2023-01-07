require 'pry'
def split_without_dropping(str, regex)
  groups = []
  str.chars.each do |char|
    #binding.pry
    if groups.empty? ||
       groups[-1][-1] =~ regex && char !=~ regex ||
       groups[-1][-1] !=~ regex && char =~ regex
      groups << char
    else
      groups[-1] << char
    end
  end
  groups
end

file_to_read = File.open("file_to_read.txt")
contents = file_to_read.read
sentences = split_without_dropping(contents, /[\.\?\!]/)
longest_sentence = ''
sentences.each_with_index do |sentence, index|
  if sentence.split.size >= longest_sentence.split.size &&
     sentence[0] !=~ /[\.\?\!]/
    longest_sentence = sentence
    if index + 1 < sentences.size
      longest_sentence << sentences[index + 1]
    end
  end
end
puts longest_sentence
puts "Length: #{longest_sentence.split.size}"