require 'rspec'
require_relative 'wordanalysis'

describe WordAnalysis do

  it 'returns a hash with the count for each word in a string' do
    test_string = WordAnalysis.new("apple apple ball ball ball can can can can can")
    expect(test_string.wordcount).to eq({"apple"=>2, "ball"=>3, "can"=>5})
  end

  it 'counts words without regard to punctuation and symbols' do
    test_string = WordAnalysis.new("apple. apple, ball; ball: ball-can .can :can +can =can")
    expect(test_string.wordcount).to eq({"apple"=>2, "ball"=>3, "can"=>5})
  end

  it 'returns a hash with the count for each letter in a string' do
    test_string = WordAnalysis.new("apple. apple, ball; ball: ball-can .can :can +can =can")
    expect(test_string.lettercount).to eq({"a"=>10, "b"=>3, "c"=>5, "e"=>2, "l"=>8, "n"=>5, "p"=>4})
  end

  it 'returns a hash with the count for each non-space symbol in a string' do
    test_string = WordAnalysis.new("apple. apple, ball; ball: ball-can .can :can +can =can")
    expect(test_string.symbol_count).to eq({"."=>2, ","=>1, ";"=>1, ":"=>2, "-"=>1, "+"=>1, "="=>1})
  end

  it 'returns a hash with the three most frequent words in a string' do
    test_string = WordAnalysis.new("apple. apple, ball; ball: ball-can .can :can +can =can foo foo blah blah blah blah")
    expect(test_string.top_three_words).to eq(["can", "blah", "ball"])
  end

  it 'returns a hash with the three most frequent letters in a string' do
    test_string = WordAnalysis.new("apple. apple, ball; ball: ball-can .can :can +can =can foo foo blah blah blah blah")
    expect(test_string.top_three_letters).to eq(["a", "l", "b"])
  end

end
