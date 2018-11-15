# To display the occurences of each word in the given text

def histogram(str)
  words = str.split(' ')
  occurences = Hash.new(0)
  words.each { |word| occurences[word] += 1}
  occurences = occurences.sort_by{ |k, v| v }
  occurences.each { |word, occur| puts word + ' ' + occur.to_s }
end

# def histogram(str)
#   words = str.split(' ')
#   occurences = words.group_by{ |word| word }
#   occurences = occurences.sort_by { |k, v| v.length }
#   occurences.each { |k, v| puts k + ' ' + v.length.to_s }
# end

print histogram('Yeu hay khong yeu khong yeu hay yeu fg')
