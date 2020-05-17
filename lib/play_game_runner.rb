require './lib/ship'
require './lib/cell'
require './lib/board'

class PlayGameRunner

  def start

    puts "Welcome to BATTLESHIP."
    puts "Enter p to play. Enter q to quit."

    input = gets.chomp
    if input == "p"
      set_up_computer
    end
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
end
