# require 'rspec'

# Check if a given list (array) is a palindrome, without reverse method
def palindrome?(list)
  if list.empty?
    p 'empty list'
  else
    reversed = list.reduce{ |x, y| y + x }.split('')
    p list == reversed
  end
end

palindrome?(%w[1 2 3 2 1])
palindrome?(%w[])
palindrome?(%w[a b c b a])
palindrome?(%w[a])


# Reverse a list, without reverse method
def reversed(arr)
  # S1.
  result = arr.reduce{ |x, y| y + x }.split('')
  # S2. Original array will be gone
  # result = []
  # arr.size.times { result << arr.pop }
  p result
end

reversed(%w[1 2 3])
reversed(%w[rails on ruby])

# RSpec::Core::Runner.run([$__FILE__])
