class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  random_word = DICTIONARY.sample
  
  def self.random_word # "the class"
    return DICTIONARY.sample
  end
  
  def initialize 
    @secret_word = Hangman::random_word 
    @guess_word = Array.new(@secret_word.length) {'_'}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end 

  def guess_word 
    return @guess_word 
  end 

  def attempted_chars 
    return @attempted_chars 
  end 

  def remaining_incorrect_guesses 
    return @remaining_incorrect_guesses 
  end 

  def already_attempted? (char)
    if @attempted_chars.include?(char)
      return true 
    else
      return false
    end 

  end 

  def get_matching_indices (char)
    narr = []
    @secret_word.each_char.with_index do |c,i|
      if char == c
        narr << i  
      end 
    end 
    return narr 
  end 

  def fill_indices (char, arr)
    arr.each_with_index do |ele,i|
      
      @guess_word[ele] = char
    end
  end


  def try_guess (char)

    if self.already_attempted?(char)
      p 'that has already been attempted'
      return false 
    else 
      @attempted_chars << char 
      return true
    end
    self.fill_indices(char,self.get_matching_indices(char))

    if !@secret_word.include?(char)
      @remaining_incorrect_guesses -= 1
    end
    
    
  
  end

  def ask_user_for_guess
    puts "Enter a char:"
    i = gets.chomp 
    self.try_guess(i)
    
  end

  def win? 
    if @guess_word.join('')== @secret_word
    
      p 'WIN'
      return true
    else 
      
      return false 
    end 
  end

  def lose?
    if @remaining_incorrect_guesses ==  0
      p 'LOSE'
      return true 
    else 
      p @secret_word 
      return false
    end
  end
    def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true 
    else 
      return false 
    end
  end

end
