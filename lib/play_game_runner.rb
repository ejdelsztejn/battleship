require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_player'
require './lib/human_player'

class PlayGameRunner

  def start
    computer = ComputerPlayer.new
    player = HumanPlayer.new

    puts "Welcome to BATTLESHIP."
    puts "Enter p to play. Enter q to quit."

    input = gets.chomp
    if input == 'p'
      computer.set_up_cruiser
      computer.set_up_submarine

      puts "The computers' ships have been placed on the board."
      puts "It is your turn to place your two ships."
      puts "The Cruiser is three units long and the Submarine is two units long."

      player.set_up_cruiser
      player.set_up_submarine

      turn(computer, player)
    end
  end

  def display_boards(computer, player)
    # Displaying boards
    puts "=============COMPUTER BOARD============="
    puts computer.board.render
    puts "==============PLAYER BOARD=============="
    puts player.board.render(true)
  end

  def turn(computer, player)
    10.times do
      display_boards(computer, player)

  
      # Player shot
      loop do
        puts "Enter coordinate to fire upon"
        player_input = gets.chomp
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
        puts "That is not a valid coordinate. Please try again:"
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
