
require 'rspec'

# To display the occurences of each word in the given text
RSpec.describe 'occurences of each word in a text' do
  def histogram(str)
    occurences = Hash.new(0)
    str.split(' ').map(&:downcase).each { |word| occurences[word] += 1}
    # occurences = occurences.sort_by{ |k, v| v }
    # occurences.each { |word, occur| puts word + ' ' + occur.to_s }
    return occurences
  end

  it 'displays occurences map of all words' do
    expect(histogram('Ala ma kota i ala ma psa')).to eql({'kota' => 1, 'i' => 1, 'psa' => 1, 'ala' => 2, 'ma' => 2})
  end
end



# def histogram(str)
#   words = str.split(' ')
#   occurences = words.group_by{ |word| word }
#   occurences = occurences.sort_by { |k, v| v.length }
#   occurences.each { |k, v| puts k + ' ' + v.length.to_s }
# end

RSpec::Core::Runner.run([$__FILE__])
