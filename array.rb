require 'rspec'

# Duplicate elements of a list
RSpec.describe 'duplicating elements of a list' do
  def duplicate(arr)
    arr.map { |x| x * 2 }
  end

  it 'returns a list with duplicated elements' do
    expect(duplicate(%w[a b c])).to eql(%w[aa bb cc])
  end
end

# Duplicate elements of a list a given number of times
RSpec.describe 'duplicating elements of a list n times' do
  def duplicate_n(n, arr)
    arr.map { |x| x * n }
  end

  it 'returns a list of elements duplicated n times' do
    expect(duplicate_n(3, %w[a b c])).to eql(%w[aaa bbb ccc])
  end
end

# Drop every N-th element from a list
RSpec.describe 'dropping every n element' do
  def drop_n(n, arr)
    dropped = ((n - 1)...arr.size).step(n).map { |i| arr[i] }
    arr - dropped
  end

  it 'return a list without dropped elements' do
    expect(drop_n(3, %w[a b c d e f g])).to eql(%w[a b d e g])
  end
end

# Split a list into 2 parts. The length of the first part is given.
RSpec.describe 'splitting a list' do
  def split(n, arr)
    arr1 = arr[0, n]
    arr2 = arr - arr1
    result = [arr1, arr2]
  end

  it 'splits a list into 2 sublists' do
    expect(split(2, %w[a b c d e])).to eql([%w[a b], %w[c d e]])
  end
end

# Refactor needed!!!
# Rotate a list of N places to the left
RSpec.describe 'rotating N elements to the left' do
  def rotate_n(n, arr)
    if n == 0
      arr
    elsif n > 0
      chopped = arr.shift(n)
      arr << chopped
      arr.flatten
    else
      chopped = arr.pop(-n)
      arr.insert(0, chopped)
      arr.flatten
    end
  end

  it 'rotates n elements to the left' do
    expect(rotate_n(3, %w[a b c d e f g h])).to eql(%w[d e f g h a b c])
    expect(rotate_n(-2, %w[a b c d e f g h])).to eql(%w[g h a b c d e f])
  end
end

# Calculate an average value of all elements of an array of integers(or real)
RSpec.describe 'average value of all elements of array of integers' do
  def average(arr)
    sum = arr.reduce { |sum, e| (sum + e) }
    result = sum.to_f / arr.length
  end

  it 'calculates average values of array of integers' do
    expect(average([0, 0])).to eql(0.0)
    expect(average([2, 3])).to eql(2.5)
    expect(average([1, 2, 3])).to eql(2.0)
  end
end

# Find maximum element of an array
RSpec.describe 'maximum element of array' do
  def find_max(arr)
    max = arr[0]
    for i in 0...arr.length
      max = arr[i] if arr[i] > max
    end
    return max
  end

  it 'displays the maximum element' do
    expect(find_max([1, 4, 7])).to eql(7)
  end
end

# Find maximum and minimum elements of an array (using one for loop)
RSpec.describe 'max and min elements of an array' do
  def max_min(arr)
    max, min = arr[0], arr[0]
    for i in 0...arr.length
      min = arr[i] if arr[i] < min
      max = arr[i] if arr[i] > max
    end
    return {max: max, min: min}
  end

  it 'displays max and min element of array' do
    expect(max_min([1, 9, 2, 0])).to eql({max: 9, min: 0})
  end
end

# Find the longest string of an array of strings, together with it’s length
RSpec.describe 'longest string of an array of strings' do
  def longest_string(arr)
    longest = arr[0]
    for i in 0...arr.length
      longest = arr[i] if arr[i].length > longest.length
    end
    return {longest: longest, length: longest.length}
  end

  it 'displays the longest string' do
    expect(longest_string(%w[hello summer where are you])).to eql({longest: 'summer', length: 6})
  end
end

# Create an array from an arbitrary array of integers, containing only the values >= 5
RSpec.describe 'array containing elements greater than or equal 5' do
  def greater_equal_five(arr)
    result = arr.select { |x| x >= 5 }
  end

  it 'displays an array of elements which are >= 5' do
    expect(greater_equal_five([7, 3, 4, 8, 23])).to eql([7, 8, 23])
  end
end

# Reverse an array (of any length and content) without reverse method
# using for loop
RSpec.describe 'reversed array of a given array' do
  def reversed_arr(arr)
    # S2. result = [] // using Interger#times
    #     arr.size.times { result << arr.pop } // remove the last element (pop) of array and append (<<) to new array (result) in 3 (arr.size) times

    # S3.
    result = []
    for i in (0...arr.length).to_a.reverse
      result << arr[i]
    end
    return result

    # # S4. Recursion (ongoing)
    # return arr if arr.length == 1
    # last_element = arr[-1].to_a
    # arr_without_last = arr.slice(0..-2)
    # result = last_element + reversed_arr(arr_without_last)
  end

  it 'displays reversed array' do
    expect(reversed_arr(%w[where is summer])).to eql(%w[summer is where])
  end
end

# Find the element in array which has the most occurences
RSpec.describe 'the most occurenced element in array' do
  def most_occurenced(arr)
    occurences = Hash.new(0)
    arr.each { |element| occurences[element] += 1 }
    occurences.key(occurences.values.max)
    # occurences.max_by { |k, v| v } # Return the key-value pair based on value
  end

  it 'display the array/s element having the most occurence' do
    expect(most_occurenced([ 1, 2, 3, 4, 3, 5, 1, 3 ])).to eql(3)
  end
end

# (**) Flatten a nested list structure
# Input = [[[1, 1], 2], [3, [5, 8]]]
# Output = [1, 1, 2, 3, 5, 8]

# (**) Eliminate consecutive duplicates of list elements
# Input = %w(a a a b c c d d e e e)
# Output = %w(a b c d e)

# Pack consecutive duplicates of list elements into sublists
# Input = %w(a a a b c c d d e e e)
# Output = [[a, a, a], [b], [c, c], [d, d], [e, e, e]]

# Decode a run-length encoded list
# Input = [[3, a], [1, b], [2, c], [2, d], [3, e]]
# Output = %w(a a a b c c d d e e e)

# Run-length encoding of a list (direct solution)
# Input = [a, a, a, b, c, c, d, d, e, e, e]
# Output = [[3, a], [1, b], [2, c], [2, d], [3, e]]

# Generate the combinations of N distinct objects chosen from the N elements of a list

# Group the elements of a set into disjoint subsets
# In how many ways can a group of 9 people work in 3 disjoint subgroups of 2, 3 and 4 persons?
# Generates all the possibilities

# Sorting a list of lists according to length of sublists


RSpec::Core::Runner.run([$__FILE__])
