require 'colorize'

class ValidInput
    def instruct_input(coord_input,symbol)
        inputVerify = [0,1,2]
        puts  "place " + "#{symbol}".colorize(:yellow) + "-coord" + " (please enter number 1,2,3 only)".colorize(:yellow) + " and press enter"
        coord_input = gets.chomp
        until coord_input.length == 1
            wrong_input
            puts  "place " + "#{symbol}".colorize(:yellow) + "-coord" + " (please enter number 1,2,3 only)".colorize(:yellow) + " and press enter"
            coord_input = gets.chomp
            coord_input
        end
        coord_input = coord_input.to_i - 1
        until inputVerify.include?(coord_input)
            wrong_input
            puts  "place " + "#{symbol}".colorize(:yellow) + "-coord" + " (please enter number 1,2,3 only)".colorize(:yellow) + " and press enter"
            coord_input = gets.chomp.to_i - 1
            coord_input
        end
        coord_input
    end

    def wrong_input
        puts "wrong input, please try again".colorize(:red)
    end

    def wrong_position
        puts "Oh no, a piece is already at this place! Try again...".colorize(:red)
    end
end