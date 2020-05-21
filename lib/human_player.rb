class HumanPlayer
  attr_reader :board, :cruiser, :submarine
  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def set_up_cruiser
    loop do
      puts "Enter the squares for the Cruiser (3 spaces):"
      input = gets.chomp
      cruiser_coords = input.split(" ")
      if board.valid_placement?(cruiser, cruiser_coords)
        @board.place(cruiser, cruiser_coords)
        break
      end
      puts "Those are invalid coordinates. Please try again:"
    end
  end

  def set_up_submarine
    loop do
      puts "Enter the squares for the Submarine (2 spaces):"
      input = gets.chomp
      submarine_coords = input.split(" ")
      if board.valid_placement?(submarine, submarine_coords)
        @board.place(submarine, submarine_coords)
        system 'clear'
        break
      end
      puts "Those are invalid coordinates. Please try again:"
    end
  end
end
