class WordAnalysis
  def initialize(input_string)
    @input_string = input_string
  end

  def wordcount
    text_hash = Hash.new(0)
    @input_string.downcase.scan(/\w+/) do |word|
      text_hash[word] += 1
    end
    text_hash
  end

  def lettercount
    @input_string = @input_string.downcase
    text_hash = Hash.new(0)
    @input_string.scan(/[[:alpha:]]/i).each_with_object(Hash.new(0)) { |c, h| h[c] += 1 }
  end

  def symbol_count
    text_hash = Hash.new(0)
    @input_string.downcase.scan(/[^\w\s]/) do |word|
      text_hash[word] += 1
    end
    text_hash
  end

  def top_three_words
    output = []
    input_text = WordAnalysis.new(@input_string)
    word_hash = input_text.wordcount
    top3sorted = word_hash.sort {|a,b| b[1] <=> a[1]}
    output << top3sorted[0][0]
    output << top3sorted[1][0]
    output << top3sorted[2][0]
    output
  end

  def top_three_letters
    output = []
    input_text = WordAnalysis.new(@input_string)
    letter_hash = input_text.lettercount
    top3sorted = letter_hash.sort {|a,b| b[1] <=> a[1]}
    output << top3sorted[0][0]
    output << top3sorted[1][0]
    output << top3sorted[2][0]
    output
  end
end

test_string = WordAnalysis.new("apple. apple, ball; ball: ball-can .can :can +can =can foo foo blah blah blah blah")
test_string.top_three_words
