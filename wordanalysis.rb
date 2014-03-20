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
    sorted_words = wordcount.sort_by { |word, count| -count }
    sorted_words.slice(0, 3).map { |word, count| word }
  end

  def top_three_letters
    sorted_letters = lettercount.sort_by { |word, count| -count }
    sorted_letters.slice(0, 3).map { |letter, count| letter }
  end
end

test_string = WordAnalysis.new("apple. apple, ball; ball: ball-can .can :can +can =can foo foo blah blah blah blah")
test_string.top_three_words
