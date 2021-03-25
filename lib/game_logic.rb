
slots = [1, 2, 3, 4, 5, 6, 7, 8, 9]


def player1_turn(slots)
  slots.map! {|item| item*2}
end

player1_turn(slots)


p slots