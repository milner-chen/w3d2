require_relative './board.rb'
require_relative './human_player.rb'

class Game

    def initialize
        @board = Board.new
        @prev_guess = nil
        @human_player = HumanPlayer.new
    end

    def make_guess(pos)
        @board.reveal(pos)
        @board.render
        if @prev_guess
            if !(@prev_guess == @board[pos])
                puts "Try again."
                sleep(1)
                @prev_guess.hide
                @board[pos].hide
            else
                puts "It's a match!"
                sleep(1)
            end
            @prev_guess = nil
        else
            @prev_guess = @board[pos]
        end
        ## testing
        # @board.render
        # puts "---"
    end

    def play(cards)
        @board.populate(cards)
        @board.render
        while @board.won? == false
            @board.render
            pos = @human_player.prompt
            # puts "Please enter the position of the card you'd like to flip (e.g., '2,3')"
            # pos = gets.chomp.split(",")
            # pos = pos.map {|x| x.to_i }
            make_guess(pos)
        end
        puts "You won!"
    end

end

# g = Game.new
# arr = [1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8]
# cards = []
# arr.each {|x| cards << Card.new(x.to_s) }
# p cards

# g.play(cards)
# p g

# g.make_guess([0, 2])
# g.make_guess([2, 2])
# g.make_guess([1, 1])
# g.make_guess([3, 2])