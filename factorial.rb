require 'rspec'
# # Implement (and test separately) factorial function in two ways:
# # 1. using for loop
# # 2. using recursion
RSpec.describe 'factorial function' do
  # S1: using for loop
  # def factorial(num)
  #   result = 1
  #   return nil if num < 0
  #   for i in 1..num
  #     result = result * i
  #   end
  #   result
  # end

  # S2: using recursion
  def factorial(n)
    if n < 0
      return nil
    elsif n == 0
      return 1
    else
      return n * factorial(n - 1)
    end
  end

  it 'shows factorial of an integer' do
    expect(factorial(-1)).to eql(nil)
    expect(factorial(0)).to eql(1)
    expect(factorial(5)).to eql(120)
  end
end

RSpec::Core::Runner.run([$__FILE__])
