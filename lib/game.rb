require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_player'
require './lib/human_player'
require './lib/turn'

class Game
  attr_reader :computer, :player, :computer_ships_sunk, :player_ships_sunk
  def initialize(computer, player)
    @computer = computer
    @player = player
    @computer_ships_sunk = 0
    @player_ships_sunk = 0
  end

  def start
    system 'clear'
    puts  "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts  " _           _   _   _           _     _        "
    puts  "| |         | | | | | |         | |   (_)       "
    puts  "| |__   __ _| |_| |_| | ___  ___| |__  _ _ __   "
    puts  "|  _ \ / _  | __| __| |/ _ \/ __|  _ \| | '_  \ "
    puts  "| |_) | (_| | |_| |_| |  __/\__ \ | | | | |_) | "
    puts  "|_.__/ \__,_|\__|\__|_|\___||___/_| |_|_| .__/  "
    puts  "                                        | |     "
    puts  "                                        |_|     "
    puts  "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts ""
    puts "Welcome to BATTLESHIP."
    sleep(0.8)
    puts "Enter p to play. Enter q to quit."

    input = gets.chomp
    if input == 'p'
      computer.set_up_cruiser
      computer.set_up_submarine

      system 'clear'
      puts  "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts  " _           _   _   _           _     _        "
      puts  "| |         | | | | | |         | |   (_)       "
      puts  "| |__   __ _| |_| |_| | ___  ___| |__  _ _ __   "
      puts  "| '_ \ / _` | __| __| |/ _ \/ __| '_ \| | '_ \  "
      puts  "| |_) | (_| | |_| |_| |  __/\__ \ | | | | |_) | "
      puts  "|_.__/ \__,_|\__|\__|_|\___||___/_| |_|_| .__/  "
      puts  "                                       | |      "
      puts  "                                       |_|      "
      puts  "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
      puts ""
      puts "The computers' ships have been placed on the board."
      sleep(0.8)
      puts "It is your turn to place your two ships."
      sleep(0.8)
      puts "The Cruiser is three units long and the Submarine is two units long."
      puts ""
      sleep(0.8)
      puts "  1 2 3 4 "
      puts "A . . . . "
      puts "B . . . . "
      puts "C . . . . "
      puts "D . . . . "
      puts ""

      player.set_up_cruiser
      player.set_up_submarine

      play(computer, player)
    end
  end

  def play(computer, player)
    loop do
      system 'clear'
      turn = Turn.new(computer, player)
      turn.header
      turn.display_boards(computer, player)
      turn.player_shot(player)
      turn.computer_shot(computer)
      @computer_ships_sunk += turn.computer_ships_sunk
      @player_ships_sunk += turn.player_ships_sunk
      sleep(0.8)
      if computer_ships_sunk?
        puts "You won!"
        turn.display_boards(computer, player)
        break
      elsif player_ships_sunk?
        puts "Computer won!"
        turn.display_boards(computer, player)
        break
      else
        next
      end
    end
    play_again?
  end

  def computer_ships_sunk?
    computer_ships_sunk == 2
  end

  def player_ships_sunk?
    player_ships_sunk == 2
  end

  def play_again?
    puts "Would you like to play again? (y)es / (n)o "
    input = gets.chomp
    if input.downcase == 'y'
      @computer = ComputerPlayer.new
      @player = HumanPlayer.new
      @computer_ships_sunk = 0
      @player_ships_sunk = 0
      start
    end
  end
end
