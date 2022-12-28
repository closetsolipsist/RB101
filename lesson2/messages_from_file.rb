FILENAME = "calculator_messages.txt"
file_contents = IO.readlines(FILENAME, chomp: true)
messages = {}
ind = 0
while ind < file_contents.size
  message_description = file_contents[ind]
  messages[message_description] = {}
  ind += 1
  while ind < file_contents.size && !file_contents[ind].empty?
    language = file_contents[ind].split(':')[0]
    message = file_contents[ind].split(': ')[1]
    messages[message_description][language] = message
    ind += 1
  end
  ind += 1
end

puts messages
