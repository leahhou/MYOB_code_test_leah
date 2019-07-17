require 'colorize'

class WinCase
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
        if check.include?(true)
            check = true
            return check
        else
            check = false
            return check
        end 
    end
    
    def rotate_board(board)
        board.transpose
    end
    
    def winner_vertical(board)
        board_new = rotate_board(board)
        winner_horizontal(board_new)
    end
    
    def diagonal_board(board)
        board_start = [[],[]]
        board_start[0].push(board[0][0],board[1][1],board[2][2])
        board_start[1].push(board[0][2],board[1][1],board[2][0])
        board_start
    end
    
    def winner_diagonal(board)
        board_new = diagonal_board(board)
        winner_horizontal(board_new)
    end

    def draw(board)
        not_empty_check = []
        board.each do |row|
            empty_dot = row.include?(".")
            not_empty_check.push(empty_dot)
        end
        if not_empty_check.include?(true)
            not_empty_check = false
            return not_empty_check
        else
            not_empty_check = true
            return not_empty_check
        end 
    end
end