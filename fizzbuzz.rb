require 'rspec'

# Implement Fizz buzz (https://en.wikipedia.org/wiki/Fizz_buzz)
  # 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, Fizz Buzz,
  # 16, 17, Fizz, 19, Buzz, Fizz, 22, 23, Fizz, Buzz, 26, Fizz, 28, 29, Fizz Buzz,
  # 31, 32, Fizz, 34, Buzz, Fizz, etc. …

RSpec.describe 'fizzbuzz' do
  def fizz_buzz(range)
    result = []
    range.each do |element|
      if (element % 3).zero? && (element % 5).zero?
        result << 'fizzbuzz'
      elsif (element % 5).zero?
        result << 'buzz'
      elsif (element % 3).zero?
        result << 'fizz'
      else
        result << element
      end
    end
    result
  end

  it 'shows fizz, buzz, fizzbuzz for nums divisible by 3, 5, 15' do
    expect(fizz_buzz(1..5)).to eql([1, 2, 'fizz', 4, 'buzz'])
  end
end

RSpec::Core::Runner.run([$__FILE__])
