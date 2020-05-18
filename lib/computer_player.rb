class ComputerPlayer
  attr_reader :board, :cruiser, :submarine
  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def set_up_cruiser
    loop do
      comp_cruiser_coords = Array.new
      until comp_cruiser_coords.length == computer_cruiser.length do
        comp_cruiser_coords << computer_board.cells.keys.sample
      end
      if computer_board.valid_placement?(computer_cruiser, comp_cruiser_coords)
        computer_board.place(computer_cruiser, comp_cruiser_coords)
        break
      end
    end
  end

  def set_up_submarine
    loop do
      comp_submarine_coords = Array.new
      until comp_submarine_coords.length == computer_submarine.length do
        comp_submarine_coords << computer_board.cells.keys.sample
      end
      if computer_board.valid_placement?(computer_submarine, comp_submarine_coords)
        computer_board.place(computer_submarine, comp_submarine_coords)
      end
    end
  end
end
