class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

def greeting
  puts 'TIC TAC TOE GAME'
  puts 'TO START PRESS ENTER'
  gets.chomp
end

def design_board(slots)
  system('clear')
  system('cls')

  puts '+---+---+---+'
  puts "| #{slots[0]} | #{slots[1]} | #{slots[2]} |"
  puts '+---+---+---+'
  puts "| #{slots[3]} | #{slots[4]} | #{slots[5]} |"
  puts '+---+---+---+'
  puts "| #{slots[6]} | #{slots[7]} | #{slots[8]} |"
  puts '+---+---+---+'
end

def check_win(player_arr, winning_array)
  control = false
  for array in winning_array do
    control = true if array.all? { |num| player_arr.include?(num) }
  end
  control
end
