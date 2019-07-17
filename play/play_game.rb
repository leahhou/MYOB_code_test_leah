require 'colorize'
require_relative 'set_up'
require_relative 'win_case'
require_relative 'valid_input'

set_up = SetUp.new
valid = ValidInput.new
win = WinCase.new

# Welcome game
set_up.welcome
# explain game rules
set_up.intro
# set up the game
y = [ [".", ".", "."], [".", ".", "."], [".",".","."]]
set_up.display_board(y)
#  Playing process
i = 1 
while  i < 50
    #  decide which player's turn to play
    if i%2 != 0 # player 1
        player = 1
        move = "X"
    elsif i%2 == 0  # player 2
        player = 2
        move = "O"
    end
    #  display instruction for each player to play
    puts "It's Player " + "#{player} ".colorize(:light_blue) + "'s turn now. Your move symbol is" + " #{move} ".colorize(:light_blue)
    #prompt input if player would like to give up the move
    puts "enter 'q' to give up your move or press enter to continue."
    input = gets.chomp
    if input.downcase == "q"
        i += 1
        puts "Here is the current board"
        set_up.display_board(y)
    else 
    #prompt coords
        puts "Player " + "#{player} ".colorize(:light_blue) + ", please enter a coord x,y to place your " + "#{move} ".colorize(:light_blue)
        # validate x coord
        coord_input_x = ""
        symbol = "x"
        coord_input_x = valid.instruct_input(coord_input_x, symbol)
        coord_input_x = coord_input_x.to_i

        # validate y coord
        coord_input_y = ""
        symbol = "y"
        coord_input_y= valid.instruct_input(coord_input_y, symbol)
        coord_input_y = coord_input_y.to_i
        
        #  register x & y coord, reject coord if the move is already taken
        if y[coord_input_x][coord_input_y] == "."
            puts  "Move accepted, here's the current board:" 
            move == "X" ? y[coord_input_x][coord_input_y] = move.colorize(:green) : y[coord_input_x][coord_input_y] = move.colorize(:blue)
            set_up.display_board(y)
        else 
           valid.wrong_position
           set_up.display_board(y)
           i -= 1 
        end
    # Judge winning or draw
        if  win.winner_horizontal(y)
            puts "Player #{player} won!".colorize(:yellow)
            p "Game is over now"
            break
        elsif win.winner_vertical(y)
            puts "Player #{player} won!".colorize(:yellow)
            p "Game is over now"
            break
        elsif win.winner_diagonal(y)
            puts "Player #{player} won!".colorize(:yellow)
            p "Game is over now"
            break
        elsif win.draw(y)
            puts "It's a draw".colorize(:yellow)
            p "Game is over now"
            break
        else 
            i += 1
        end 
    end
end


# edgecase
#  keep poping wrong move even though the move hasn't taken yet
#  keep poping wrong move even, wrong player turn