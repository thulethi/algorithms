# Print out all prime numbers from range 1 to 100
def find_prime
  for i in 1..100
    not_prime = false
    for j in 2..i
      if i % j == 0 && i != j
        not_prime = true
      end
    end
    puts i if not_prime == false
  end
end
