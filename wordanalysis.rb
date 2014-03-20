class WordAnalysis
  def initialize(input_string)
    @input_string = input_string
  end

  def word_count
    text_hash = Hash.new(0)
    @input_string.downcase.scan(/\w+/) do |word|
      text_hash[word] += 1
    end
    text_hash
  end

  def letter_count
    @input_string = @input_string.downcase
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
    sorted_words = word_count.sort_by { |word, count| -count }
    sorted_words.slice(0, 3).map { |word, count| word }
  end

  def top_three_letters
    sorted_letters = letter_count.sort_by { |word, count| -count }
    sorted_letters.slice(0, 3).map { |letter, count| letter }
  end
end
