class GuessingGame
    
    def initialize (min, max)

        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
        @min = min 
        @max = max
    end

    def num_attempts
        return @num_attempts
    end

    def game_over?
        return @game_over
    end

    

    def check_num(num)
        # @num_attempts += num 
        if num == @secret_num 
            @game_over = true 
            print "you win"
            @num_attempts += 1
        elsif num > @secret_num
            print "too big"
            @num_attempts += 1
        else 
            print "too small"
            @num_attempts += 1
            
        end
        
    end

    def ask_user 
        print "enter a number"
        n = gets.chomp.to_i 
        check_num(n)
    end



end
