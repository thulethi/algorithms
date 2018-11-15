require 'rspec'

# Convert string to integer or real
RSpec.describe 'a string converted to integer' do
  def convert_str_to_int(str)
    result = str.to_i
  end

  it 'display an integer' do
    expect(convert_str_to_int('12')).to eql(12)
  end
end

# Convert string containing separators (like comma) to an array of strings
RSpec.describe 'a string converted to array of strings' do
  def convert_str_to_arr(str)
    result = str.split(', ')
  end

  it 'display an array of strings' do
    expect(convert_str_to_arr('a, b, c, d')).to eql(%w[a b c d])
  end
end

# Convert string containing separators to an array of integers
RSpec.describe 'a string converted to an array of integer' do
  def convert_str_to_arr_int(str)
    result = str.split(',').map(&:to_i)
  end

  it 'display an array of integers' do
    expect(convert_str_to_arr_int('1, 2, 3, 4')).to eql([1, 2, 3, 4])
  end
end

# Print out numbers from 1 to 10 using for loop
RSpec.describe 'printing out numbers in a range' do
  def print_range_numbers(range)
    for i in range
      puts i
    end
  end

  it 'display all numbers in range' do
    expect(print_range_numbers(1..10)).to include(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
  end
end

# Print out even numbers: 2, 4, 6, 8, 10 in a range using for loop
RSpec.describe 'printing even numbers in a range' do
  def print_even_nums(range)
    range.to_a.select{|x| x.even? }
    # for i in range
    #   puts i if i % 2 == 0
    # end
  end

  it 'display even numbers in given range' do
    expect(print_even_nums(1..10)).to include(2, 4, 6, 8, 10)
  end
end

# Print out all numbers in a range which are divisible by 3
RSpec.describe 'printing numbers divisible by 3 in a range' do
  def print_nums_divisible_three(range)
    for i in range
      puts i if i % 3 == 0
    end
  end

  it 'display numbers which are divisible by 3' do
    expect(print_nums_divisible_three(1..10)).to include(3, 6, 9)
  end
end

# Print out integer pair in format:
  # - 1 1
  # - 1 2
  # - 1 3
  # - 2 1
  # - 2 2
  # - 2 3
RSpec.describe 'printing integer pair' do
  def print_int_pair
    for i in 1..2
      for j in 1..3
        puts "#{i} #{j}"
      end
    end
  end

  it 'display integer pair' do
    expect(print_int_pair).to include(1, 2)
  end
end

# Print out all elements of array [ 1, 2, 3, 4, 5 ], each element in new line, using for loop.
# After each number add word “odd” or “even” according to divisibility by 2
RSpec.describe 'printing odd even elements of array' do
  def print_odd_even(arr)
    for i in 0...arr.length
      if arr[i].to_i % 2 == 0
        puts "#{arr[i]} even"
      else
        puts "#{arr[i]} odd"
      end
    end
  end

  it 'display numbers with following odd or even' do
    expect(print_odd_even([1, 2, 3])).to include{'1 odd, 2 even, 3 odd'}
  end
end

# Print out numbers from 100 to 1 (decreasing)
RSpec.describe 'printing numbers in decrease order' do
  def print_nums_decrease(range)
    for i in range
      (range).to_a.reverse!
    end
  end

  # it 'display numbers in decreasing order' do
  #   expect(print_nums_decrease(1..10)).to include([10, 9, 8, 7, 6, 5, 4, 3, 2, 1])
  # end
end

# Print out a length of an array
RSpec.describe 'length of array' do
  def print_arr_length(arr)
    return arr.length
  end

  it 'display array/s length' do
    expect(print_arr_length(%w[bee dog cat pig])).to eql(4)
  end
end

# Print out every n element of an array
RSpec.describe 'every n element of array' do
  def every(arr, n)
    arr.select { |item| arr.index(item) % n == 0 }
  end

  it 'display every n element of array' do
    expect(every(%w[bee dog cat pig], 2)).to eql(%w[bee cat])
    expect(every([1,2,3,4], 3)).to eql([1,4])
  end
end

# Print out a sum of all elements of an array of integers
RSpec.describe 'sum of array elements' do
  def array_sum(arr)
    # sum = 0
    # arr.each { |i| sum += i.to_i }
    # return sum
    arr.reduce { |sum, x| sum + x }
  end

  it 'display sum of array' do
    expect(array_sum([1, 2, 3])).to eql(6)
  end
end


RSpec::Core::Runner.run([$__FILE__])
