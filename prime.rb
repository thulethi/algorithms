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

#  Check if a given initeger number is prime
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

# Determine the greatest common divisor of two positive integer numbers
# def gcd

# Determine whether two positive integer numbers are coprime.
# Two numbers are coprime if their greatest common divisor equals 1
# def is_coprime_to

# Determine the prime factors of a given positive integer.
# Construct a flat list containing the prime factors in ascending order.
# def prime_factors

# Determine the prime factors of a given positive integer (2).
# Construct a list containing the prime factors and their multiplicity.
# Alternately, use a Map for the result
# def prime_factor_multiplicity




RSpec::Core::Runner.run([$__FILE__])
