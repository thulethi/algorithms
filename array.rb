require 'rspec'

# Implement a function calculating an average value of all elements of an array of integers(or real)
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

# Implement a function finding maximum element of an array
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

# Implement a function returning a maximum and minimum element of an array (using one for loop)
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

# Implement a function finding the longest string of an array of strings, together with it’s length
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

# Create an array from an arbitrary array of integers, containing only the values greater or equal 5
RSpec.describe 'array containing elements greater than or equal 5' do
  def greater_equal_five(arr)
    result = arr.select { |x| x >= 5 }
  end

  it 'displays an array of elements which are >= 5' do
    expect(greater_equal_five([7, 3, 4, 8, 23])).to eql([7, 8, 23])
  end
end

# Create an array which is a reverse of a given array (of any length and content)
# using for loop (there is already reverse function, so don’t use it)
RSpec.describe 'reversed array of a given array' do
  def reversed_arr(arr)
    # S1. result = arr.reverse // built_in method 'reverse'
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

RSpec::Core::Runner.run([$__FILE__])
