require 'colorize'
require_relative 'set_up'
require_relative 'win_case'
require_relative 'valid_input'

valid = ValidInput.new
set_up = SetUp.new
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
    puts "enter 'q' to give up your move or press any key to continue."
    input = gets.chomp
    if input.downcase == "q"
        i += 1
    else 
        #prompt coords
        puts "Player " + "#{player} ".colorize(:light_blue) + ", please enter a coord x,y to place your " + "#{move} ".colorize(:light_blue)

        #  validate x & y coord
        coord_input_x = ""
        coord_input_y = ""
        coord = "x"
        valid.instruct_input(coord_input_x,coord)
        coord = "y"
        valid.instruct_input(coord_input_y,coord)

        #  register x & y coord
        coord_input_x = coord_input_x.to_i
        coord_input_y = coord_input_y.to_i
        if y[coord_input_x][coord_input_y] == "."
            puts  "Move accepted, here's the current board:" 
            move == "X" ? y[coord_input_x][coord_input_y] = move.colorize(:green) : y[coord_input_x][coord_input_y] = move.colorize(:blue)
            set_up.display_board(y)
        else 
           valid.wrong_position
           set_up.display_board(y)
           i -= 1
        end
        # Judge winning
        if  win.winner_horizontal(y)
            puts "Player #{player} won!".colorize(:yellow)
            p "Game is over now"
            i = 50
        elsif win.winner_vertical(y)
            puts "Player #{player} won!".colorize(:yellow)
            p "Game is over now"
            i = 50
        elsif win.winner_diagonal(y)
            puts "Player #{player} won!".colorize(:yellow)
            p "Game is over now"
            i = 50
        elsif win.draw(y)
            puts "It's a draw".colorize(:yellow)
            p "Game is over now"
            break
        else 
            i += 1
        end 
    end
end



