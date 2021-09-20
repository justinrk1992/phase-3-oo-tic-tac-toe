class TicTacToe

    WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
    ]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board 
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i-1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == "X" || @board[index] == "O"
            true
        else 
            false
        end
    end

    def valid_move?(index)
        if index.between?(0, 8)
            if position_taken?(index)
                false
            else
                true
            end
        else
            false
        end
    end

    def turn_count
        count = 0
        @board.each do |pos|
            if pos == "X" || pos == "O"
                count += 1
            end
        end
        count
    end

    def current_player
        if turn_count % 2 == 0
            "X"
        else 
            "O"
        end
    end

    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            value = current_player
            move(index, value)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.each do |el|
            pos1 = @board[el[0]]
            pos2 = @board[el[1]]
            pos3 = @board[el[2]]
            if (pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O")
                return el
            end
        end
        false
    end

    def full?
        @board.all? do |el|
            position_taken?(@board.index(el))
        end
    end

    def draw?
        if full? && won? == false
            true
        else
            false
        end
    end

    def over?
        if draw? || won?
          return true
        else
            false
        end
    end

    def winner
        if won?
          return board[won?(board)[0]]
        end
    end

    def winner 
        WIN_COMBINATIONS.detect do |combo| 
              if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" 
                return "X"
              elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
                return "O"
              else 
                nil
              end
        end
      end
    
      def play
        until over?
          turn
        end
    
        if won? 
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      end





end