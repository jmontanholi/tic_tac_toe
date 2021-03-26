class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

def check_win(player_arr, winning_array)
  control = false
  for array in winning_array do
    control = true if array.all? { |num| player_arr.include?(num) }
  end
  control
end

class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def winner(player, player_arr, winning_numbers)
    puts "#{player.name.capitalize} wins"
    true if check_win(player_arr, winning_numbers)
  end

  def tie(slots)
    puts "It's a Tie!!"
    return true if slots.none? { |item| item.is_a? Integer }
  end

  def start_game(slots, player1_arr, player2_arr, winning_numbers)
    tie = false
    until tie
      # Make board First time.
      Board.design_board(slots)
      # Define remaining_slots variable.
      remaining_slots = slots.select { |item| item.is_a? Integer }
      # Player 1 turn.
      player_turn(slots, @player1.name, 'X', remaining_slots, player1_arr)
      sleep 1
      # Check If player 1 wins with his move.
      break if winner(@player1, player1_arr, winning_numbers)
      # Clear board so winner message does not stay in the screen in a tie.
      Board.design_board(slots)
      # Check if it is a tie.
      break if tie(slots)
      # Redefine remaining_slots to give players their real options.
      remaining_slots = slots.select { |item| item.is_a? Integer }
      # Clear board so tie message does not stick in the screen.
      Board.design_board(slots)
      #Player 2 turn.
      player_turn(slots, @player2.name, 'O', remaining_slots, player2_arr)
      sleep 1
      # Check If player 2 wins with his move.
      break if winner(@player2, player2_arr, winning_numbers)
      # Clear board so winner message does not stay in the screen in a tie.
      Board.design_board(slots)
      # Check if it is a tie
      break if tie(slots)
    end
  end
end
