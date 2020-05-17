require './lib/ship'
require './lib/cell'
require './lib/board'

class PlayGameRunner

  def start

    puts "Welcome to BATTLESHIP.
  Enter p to play. Enter q to quit."

    input = gets.chomp
    if input == "p"
      set_up
    end
  end

  def set_up
    player_board = Board.new
    computer_board = Board.new # original_hash.to_a.sample(n).to_h
    # generate two ships: a submarine and a cruiser for computer
    #
    #
    # we want to find random cells from the @cells
    # Check that the cells are valid
    # if valid_placement? place_ship

  end
end
