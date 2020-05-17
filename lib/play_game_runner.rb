require './lib/ship'
require './lib/cell'
require './lib/board'

class PlayGameRunner

  def start

    puts "Welcome to BATTLESHIP."
    puts "Enter p to play. Enter q to quit."

    computer_input = gets.chomp
    if computer_input == "p"
      set_up_computer
    end

    set_up_player
  end

  def set_up_computer
    computer_board = Board.new
    computer_cruiser = Ship.new("Cruiser", 3)
    computer_submarine = Ship.new("Submarine", 2)

    comp_cruiser_coords = Array.new
    loop do
      comp_cruiser_coords = Array.new
      until comp_cruiser_coords.length == computer_cruiser.length do
        comp_cruiser_coords << computer_board.cells.keys.sample
      end
      break if computer_board.valid_placement?(computer_cruiser, comp_cruiser_coords)
    end

    computer_board.place(computer_cruiser, comp_cruiser_coords)

    comp_submarine_coords = Array.new
    loop do
      comp_submarine_coords = Array.new
      until comp_submarine_coords.length == computer_submarine.length do
        comp_submarine_coords << computer_board.cells.keys.sample
      end
      break if computer_board.valid_placement?(computer_submarine, comp_submarine_coords)
    end

    computer_board.place(computer_submarine, comp_submarine_coords)

    puts ""
    puts computer_board.render(true)
  end

  def set_up_player
    player_board = Board.new
    player_cruiser = Ship.new("Cruiser", 3)
    player_submarine = Ship.new("Submarine", 2)

    puts "The computers ships have been placed on the board."
    puts "It is your turn to place your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts "Enter the squares for the Cruiser (3 spaces):"


    # player needs to select 3 valid placement cells
    # > A1 A2 A3
    # Enter the squares for the Submarine (2 spaces):

    # player_cruiser_coords = Array.new
    loop do
      player_input = gets.chomp
      list = player_input.split(" ")
      p list
      # player_cruiser_coords = Array.new
      # until player_cruiser_coords.length == player_cruiser.length do
      #   player_cruiser_coords << player_board.cells.keys.sample
      # end
      break #player_board.valid_placement?(player_cruiser, player_cruiser_coords)
    end

    # player_board.place(player_cruiser, player_cruiser_coords)
    #
    # # player_submarine_coords = Array.new
    # # loop do
    # #   # player_submarine_coords = Array.new
    # #   # until player_submarine_coords.length == player_submarine.length do
    # #   #   player_submarine_coords << player_board.cells.keys.sample
    # #   # end
    # #   break if #player_board.valid_placement?(player_submarine, player_submarine_coords)
    # # end
    #
    # # player_board.place(player_submarine, player_submarine_coords)
    #
    # puts ""
    # puts player_board.render(true)
  end
end
