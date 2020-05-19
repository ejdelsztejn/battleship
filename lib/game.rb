require './lib/ship'
require './lib/cell'
require './lib/board'

class Game

def initialize

end


  def start
    computer_board = Board.new
    player_board = Board.new

    puts "Welcome to BATTLESHIP."
    puts "Enter p to play. Enter q to quit."

    computer_input = gets.chomp
    if computer_input == "p"
      set_up_computer(computer_board)
    end

    set_up_player(player_board)

    turn(computer_board, player_board)
  end

  def set_up_computer(computer_board)

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
    puts computer_board.render
  end

  def set_up_player(player_board)

    player_cruiser = Ship.new("Cruiser", 3)
    player_submarine = Ship.new("Submarine", 2)

    puts "The computers ships have been placed on the board."
    puts "It is your turn to place your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."

    player_cruiser_coords = Array.new
    loop do
      puts "Enter the squares for the Cruiser (3 spaces):"
      player_input = gets.chomp
      player_cruiser_coords = player_input.split(" ")
      break if player_board.valid_placement?(player_cruiser, player_cruiser_coords) == true
      puts "Those are invalid coordinates. Please try again:"
    end
    player_board.place(player_cruiser, player_cruiser_coords)

    player_submarine_coords = Array.new
    loop do
      puts "Enter the squares for the Submarine (2 spaces):"
      player_input = gets.chomp
      player_submarine_coords = player_input.split(" ")
      break if player_board.valid_placement?(player_submarine, player_submarine_coords) == true
      puts "Those are invalid coordinates. Please try again:"
    end
    player_board.place(player_submarine, player_submarine_coords)
    puts player_board.render(true)
  end

  def turn(computer_board, player_board)
    3.times do
      # Displaying boards
      puts "=============COMPUTER BOARD============="
      puts computer_board.render
      puts "==============PLAYER BOARD=============="
      puts player_board.render(true)

      # Player shot
      loop do
        puts "Enter coordinate to fire upon"
        player_input = gets.chomp
        #put the fired_upon? method here to keep track of coordinates that have already been fired upon
        # puts "You have already fired upon that coordinate. Please choose again."
        if computer_board.valid_coordinate?(player_input) == true
          computer_board.cells[player_input].fire_upon
          if computer_board.cells[player_input].render(true) == "M"
            puts "Your shot on #{player_input} was a miss."
          elsif computer_board.cells[player_input].render(true) == "H"
            puts "Your shot on #{player_input} was a hit."
          elsif computer_board.cells[player_input].render(true) == "X"
            puts "Your shot on #{player_input} sunk the #{computer_board.cells.ship.name}."
          end
          break
        end
        puts "That is not a valid coordinate. Please try again."
      end

      # Computer Shot
      computer_input = player_board.cells.keys.sample
      if player_board.valid_coordinate?(computer_input) == true
        player_board.cells[computer_input].fire_upon
        if player_board.cells[computer_input].render(true) == "M"
          puts "Computer shot on #{computer_input} was a miss."
        elsif player_board.cells[computer_input].render(true) == "H"
          puts "Computer shot on #{computer_input} was a hit."
        elsif player_board.cells[computer_input].render(true) == "X"
          puts "Computer shot on #{computer_input} sunk the #{player_board.cells.ship.name}."
        end
      end
    end
  end


end
