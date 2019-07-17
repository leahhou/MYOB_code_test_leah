test1 = [[1,2,1],[1,1,6],[1,9,1]]
test2 = ["x","x","x"]
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

def rotate_board(board)
    boardNew = board.transpose
end

def winner_horizontal(board)
    check = []
    board.each do |item|
        if !(item.any? {|x| x != item[0]}) && !item.include?(".")#check if the values of all elements in array the same, will be true if they are the same
            check.push(true)
            # break
         else !(item.any? {|x| x != item[0]}) 
         check.push(false)
        end
    end
    p check
    if check.include?(true)
        check = true
        p check
        return check
    else
        check = false
        p check
        return check
    end 
end

def winner_check(board)
    if board.all? {|x| x == board[0]}
        check = true
    else
        check = false
    end
    p check
    return check 
end

def test()
    check = 1
    check
end

# puts  "place " + "x ".colorize(:yellow) + "coord" + " (please enter number 1,2,3 only)"
# coordX = gets.chomp.to_i - 1
# inputVerify = [0,1,2]
# until inputVerify.include?(coordX)
#     puts "wrong input, please try again"
#     puts  "place " + "x ".colorize(:yellow) + "coord" + " (please enter number 1,2,3 only)"
#     coordX = gets.chomp.to_i - 1
# end
# p coordX
# p "I am here"

#prompt input if player would like to give up the move
    # i = 1 
    # while  i < 10
    #     #  decide which player's turn to play
    #     if i%2 != 0 # player 1
    #         player = 1
    #         move = "X"
    #     elsif i%2 == 0 # player 2
    #         player = 2
    #         move = "O"
    #     end

    #     puts "It's Player " + " #{player} ".colorize(:light_blue) + "'s turn. Please enter a coord x,y to place your " + "#{move} ".colorize(:light_blue) + "or enter 'q' to give up:"
    #     puts "enter 'q' to give up or any key to continue"
    #     input = gets.chomp
    #     if input == "q"
    #         i += 1
    #     else 
    #         puts "Player " + " #{player}".colorize(:light_blue) + "'s playing now"
    #         i += 1
    #     end
    # end

#  test construct diagonal array
def diagonal_board(board)
    board_start = [[],[]]
    board_start[0].push(board[0][0],board[1][1],board[2][2])
    board_start[1].push(board[0][2],board[1][1],board[2][0])
    p board_start
end



# winner_horizontal(test1)
# winner_check(test2)
# # test()
# diagonal_board(test1)


