require './lib/ship'
require './lib/cell'
require './lib/board'

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

  def turn(computer_board, player_board)
    # A single turn consists of:

    # Displaying the boards
    # Player choosing a coordinate to fire on
    # Computer choosing a coordinate to fire on
    # Reporting the result of the Player’s shot
    # Reporting the result of the Computer’s shot

    # Displaying boards
    puts "=============COMPUTER BOARD============="
    puts computer_board.render
    puts "==============PLAYER BOARD=============="
    puts player_board.render(true)

    # Player shot
    # 1.) Player prompted to give coordinate
    # 2.) Player gives coordinate
    # 3.) If coordinate if invalid, prompt again
    # 4.) Else, fire on coordinate
    loop do
      puts "Enter coordinate to fire upon"
      player_input = gets.chomp
      if computer_board.valid_coordinate?(player_input) == true
        computer_board.cells[player_input].fire_upon
        break
      end
      puts "That is not a valid coordinate. Please try again:"
    end

    # Computer Shot
    computer_input = player_board.cells.keys.sample
    if player_board.valid_coordinate?(computer_input) == true
      player_board.cells[computer_input].fire_upon
    end
  end
end
