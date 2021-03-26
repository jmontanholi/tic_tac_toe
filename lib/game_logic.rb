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
      Board.design_board(slots)

      remaining_slots = slots.select { |item| item.is_a? Integer }

      player_turn(slots, @player1.name, 'X', remaining_slots, player1_arr)
      sleep 1

      break if winner(@player1, player1_arr, winning_numbers)

      Board.design_board(slots)
      break if tie(slots)

      remaining_slots = slots.select { |item| item.is_a? Integer }

      Board.design_board(slots)

      player_turn(slots, @player2.name, 'O', remaining_slots, player2_arr)

      remaining_slots = slots.select { |item| item.is_a? Integer }
      sleep 1

      break if winner(@player2, player2_arr, winning_numbers)

      Board.design_board(slots)
      break if tie(slots)
    end
  end
end
