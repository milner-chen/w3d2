require_relative './card.rb'

class Board

    def initialize
        # assuming the grid is a size of 
        @grid = Array.new(4) { Array.new(4) }
    end

    def populate(cards)
        i = 0
        (0...@grid.length).each do |x|
            (0...@grid.length).each do |y|
                @grid[x][y] = cards[i]
                i += 1
            end
        end
        nil
    end

    def render
        system("clear")
        puts "  0 1 2 3"
        @grid.each_with_index do |row, i|
            print "#{i} "
            puts row.map {|x| x.to_s }.join(" ")
        end
        nil
    end

    def won?
        @grid.all? {|row| row.all? {|c| c.face_up } }
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def reveal(guess)
        
        self[guess].reveal if self[guess].face_up == false
        self[guess].display_value
    end

end

# b = Board.new
# p b
# p "---------"
# cards = []
# (0..15).each do |x|
#     cards << Card.new(x.to_s)
# end

# # cards.each {|x| x.reveal }

# p cards
# b.populate(cards)
# p "---- render -----"
# b.render
# # p cards[0].display_value
# p b.won?

# p b.reveal([0, 0])

# b.render