require 'rspec'

# Print out all prime numbers from range 1 to 100
RSpec.describe 'find all prime number in a range' do
  it 'display prime numbers in range 1..10' do
    expect(find_prime(1..10)).to include(1, 2, 3, 5, 7)
    expect(find_prime(3..20)).to include(3, 5, 7, 11, 13, 17, 19)
  end
end

def find_prime(range)
  for i in range
    not_prime = false
    for j in 2..i
      if i % j == 0 && i != j
        not_prime = true
      end
    end
    puts i if not_prime == false
  end
end

#  Check if an input number is prime number
RSpec.describe 'check if a number is prime' do
  it 'check if a number is prime' do
    expect(check_if_prime(97)).to eql(true)
    expect(check_if_prime(34)).to eql(false)
  end
end

def check_if_prime(number)
  is_prime = true
  for i in 2..number
    if number % i == 0 && number != i
      is_prime = false
    end
  end
  return is_prime
end


RSpec::Core::Runner.run([$__FILE__])
