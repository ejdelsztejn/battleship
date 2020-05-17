require './lib/ship'
require './lib/cell'
require './lib/board'

class PlayGameRunner

  def start

    puts "Welcome to BATTLESHIP.
  Enter p to play. Enter q to quit."

    input = gets.chomp
    if input == "p"
      set_up_computer
    end
  end

  def set_up_computer
    computer_board = Board.new
    computer_cruiser = Ship.new("Cruiser", 3)
    computer_submarine = Ship.new("Submarine", 2)
    # original_hash.to_a.sample(n).to_h
    # * generate an array of random cells (that adhere
    # to valid placement rules) for each ship

    # we want to find random cells from the @cells
    # Check that the cells are valid
    # if valid_placement? place_ship
    # set_up_player
    comp_cruiser_coords = Array.new
    loop do
      comp_cruiser_coords = Array.new
      until comp_cruiser_coords.length == computer_cruiser.length do
        comp_cruiser_coords << computer_board.cells.keys.sample
      end
      break if computer_board.valid_placement?(computer_cruiser, comp_cruiser_coords)
    end
    computer_board.place(computer_cruiser, comp_cruiser_coords)
    p computer_board.render(true)

    # comp_submarine_coords = Array.new
    # loop do
    #   comp_submarine_coords = Array.new
    #   until comp_submarine_coords.length == computer_submarine.length do
    #     comp_submarine_coords << computer_board.cells.keys.sample
    #   end
    #   break if computer_board.valid_placement?(computer_submarine, comp_submarine_coords)
    # end
    #
    # p comp_submarine_coords
  end

  def set_up_player
    player_board = Board.new
    player_cruiser = Ship.new("Cruiser", 3)
    player_submarine = Ship.new("Submarine", 2)

    puts "The computers ships have been placed on the board."
    puts "It is your turn to place your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
      1 2 3 4
    A . . . .
    B . . . .
    C . . . .
    D . . . .
  end
end
