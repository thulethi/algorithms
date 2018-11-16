require 'rspec'

# Write and test a function which hides bad words (fuck, shit, ass and motherfucker) by using “*” from a string
# 1. Number of stars should be equal to the number od characters in replaced string
# 2. For example for “What the fuck is this shit, you motherfucker?!” it should give “What the **** is this ****, you ************?!”

RSpec.describe 'hiding bad words in a string' do
  def hide_bad_words(str)
    bad_words = /fuck|shit|ass|motherfucker/
    str.gsub(bad_words) { |word| "*" * word.length }
  end

  it 'hides bad words and replaces them with *' do
    expect(hide_bad_words('What the fuck is this shit, you motherfucker?!')).to eql('What the **** is this ****, you ************?!')
  end
end

RSpec::Core::Runner.run([$__FILE__])
