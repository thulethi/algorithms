require 'rspec'

# Locate all the indices of one character in a string
# For example for "ala ma kota", indices of character "a" is [0, 2, 5, 10]
# Solution:
#   - Convert string -> array of characters
#   - Iterate through result (array)
#   - Select the indices of "a"
RSpec.describe 'occurences of a character in a string' do
  def find_indices(str, x)
    indices = str.chars
      .each_with_index.select { |char, i| char == x }
      .map(&:last) # converts the two dimensional array into a one-dimensional array of the indices
  end

  it 'display indices of one character' do
    expect(find_indices('ala ma kota', 'a')).to eql([0, 2, 5, 10])
  end
end

# # In a string containing letters find the longest sequence of the same letter.
# # For example for “aaabbbbccb” it should return “bbbb”
RSpec.describe 'longest sequence of the same letter in a string' do
  def group_sequence(str)
    arr = str.split('')
    result = []
    occur = 1
    for i in 1...arr.length
      if arr[i] != arr[i - 1]
        result << arr[i - 1].to_s * occur
        occur = 1
      else
        occur += 1
      end
    end
    result << arr[i]
  end

  def longest_sequence(str)
    return str if str.size == 1
    grouped_arr = group_sequence(str)
    longest = grouped_arr[0]
    for i in 0...grouped_arr.length
      longest = grouped_arr[i] if grouped_arr[i].length > longest.length
    end
    longest
  end

  it 'displays the longest sequence of same letter' do
    expect(longest_sequence('aaabbbbccb')).to eql('bbbb')
  end
end

# In a string containing letters reduce duplicates to one letter.
# For example for “aaabbbbccb” it should return “abcb”
RSpec.describe 'duplicates reduced to one' do
  def reduce_duplicates(str)
    result = []
    arr = str.split('')
    for i in 1...arr.length
      if arr[i] != arr[i - 1]
        result << arr[i - 1]
      end
    end
    result << arr[i]
    result.join('')
  end

  it 'reduces duplicates down to one' do
    expect(reduce_duplicates('aaabbbbccb')).to eql('abcb')
  end
end

# In a string containing letters remove duplicate sequences.
# For example for “aaabbbbccbaaadccb” it should return “aaabbbbccbd”
RSpec.describe 'duplicates removed from a string' do

  it 'removes duplicated groups from a string' do
    expect(remove_duplicates('aaabbbbccbaaadccb')).to eql('aaabbbbccbd')
end


RSpec::Core::Runner.run([$__FILE__])
