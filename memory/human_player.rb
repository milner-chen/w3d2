class HumanPlayer

    def prompt
        puts "Please enter the position of the card you'd like to flip (e.g., '2,3')"
        pos = gets.chomp.split(",")
        pos.map {|x| x.to_i }
    end

end