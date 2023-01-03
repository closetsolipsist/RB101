# this should probably be more efficient
def rolling_buffer1(buffer, max_buffer_size, new_element)
  # in this case, we're mutating the array in place
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  # in this case, we're making a new variable containing the concatenation
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
