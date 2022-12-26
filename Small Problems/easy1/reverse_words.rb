def reverse_words(sentence)
  (sentence.split(' ').map {|word| word.size >= 5 ? word.reverse : word}).join(' ')
end
