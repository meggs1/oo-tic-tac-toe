class TicTacToe
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,4,8],
        [2,4,6],
        [0,3,6],
        [1,4,7],
        [2,5,8]
    ]

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        index = input.to_i - 1
    end

    def move(index, player = "X")
        @board[index] = player
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
    end

    def valid_move?(index)
        index.between?(0,8) && position_taken?(index) == false
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        input = gets(input)
        index = input_to_index(input)
        player = current_player
        if valid_move?(index)
            move(index, player)
            display_board
        else
            turn
        end
    end

    def won?
       set_1 = WIN_COMBINATIONS.find do |num|
            @board[num[0]] == "X" && @board[num[1]] == "X" && @board[num[2]] == "X"
       end
       set_2 = WIN_COMBINATIONS.find do |num|
            @board[num[0]] == "O" && @board[num[1]] == "O" && @board[num[2]] == "O"
        end
        return set_1 || set_2
    end

    def full?
        !@board.include?(" ")
    end

    def draw?
        !won? && full?
    end

    def over?
        won? || draw?
    end

    def winner
        winner = " "
        if winner = won?
            return @board[winner.first]
        end
    end

    def play
        until over?
           turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else draw?
            puts "Cat's Game!"
        end
    end


end