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

      play(computer, player)
    end
  end

  def play(computer, player)
    15.times do
      turn = Turn.new(computer, player)
      turn.display_boards(computer, player)
      turn.player_shot(player)
      turn.computer_shot(computer)
      @computer_ships_sunk += turn.computer_ships_sunk
      @player_ships_sunk += turn.player_ships_sunk
    end
  end

  # def computer_ships_sunk?(player)
  #   
  # end
  #
  # def player_ships_sunk?(player)
  #
  # end
end
