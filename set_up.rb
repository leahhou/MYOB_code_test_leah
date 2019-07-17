require 'colorize'

class SetUp
    def display_board(item)
        item.each do |r|
            puts r.each { |p| p }.join(" ")
        end
    end

    def intro
        puts "How to play : " 
        puts "The 1st player who connect their moves in either horizontally, vertically or diagonally will win the game."
        puts "In Order to enter your move, enter X coord first and then Y coord first."
        puts "Top row has X coord 1, middle row has X coord 2, 3rd row has X coord 3."
        puts "left column has Y coord 1, middle column has Y coord 2, far right row has Y coord 3."
        puts "Have Fun Playing!"
        puts "Press Any key to start the game".colorize(:yellow)
        gets.chomp
        puts "Here's the current board:".colorize(:yellow)
    end

    def welcome
        puts "Welcome to Tic Tac Toe!".colorize(:yellow)
    end
end