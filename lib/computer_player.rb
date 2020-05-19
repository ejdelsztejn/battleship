class ComputerPlayer
  attr_reader :board, :cruiser, :submarine 
  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def set_up_cruiser
    loop do
      cruiser_coords = Array.new
      until cruiser_coords.length == cruiser.length do
        cruiser_coords << board.cells.keys.sample
      end
      if board.valid_placement?(cruiser, cruiser_coords)
        @board.place(cruiser, cruiser_coords)
        break
      end
    end
  end

  def set_up_submarine
    loop do
      submarine_coords = Array.new
      until submarine_coords.length == submarine.length do
        submarine_coords << board.cells.keys.sample
      end
      if board.valid_placement?(submarine, submarine_coords)
        @board.place(submarine, submarine_coords)
        break
      end
    end
  end
end
