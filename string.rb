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
      .each_with_index.select { |char, i| char == x } # each_with_index returns a two-dimensional array containing the an entry for each char and its index,
                                                      # select whittles it down to just the entries where the character
      .map(&:last) # converts the two dimensional array into a one-dimensional array of the indices
  end

  it 'display indices of one character' do
    expect(find_indices('ala ma kota', 'a')).to eql([0, 2, 5, 10])
  end
end


# In a string containing letters find the longest sequence of the same letter.
# For example for “aaabbbbccb” it should return “bbbb”

# In a string containing letters reduce duplicates to one letter.
# For example for “aaabbbbccb” it should return “abcb”

# In a string containing letters remove duplicate sequences.
# For example for “aaabbbbccbaaadccb” it should return “aaabbbbccbd”

RSpec::Core::Runner.run([$__FILE__])
