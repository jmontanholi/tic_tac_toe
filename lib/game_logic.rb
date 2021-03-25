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

def check_win(player_arr)
  winning_numbers = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [1, 5, 9],
  [3, 5, 7],
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9]
  ]

  winning_numbers.each do |array|
    control = 0
    array.each { |num| control += 1 if player_arr.include?(num)  }
    control.zero?
  end
end
