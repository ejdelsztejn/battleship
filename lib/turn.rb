require './lib/game'

class Turn
  attr_reader :computer, :player, :computer_ships_sunk, :player_ships_sunk
  def initialize(computer, player)
    @computer = computer
    @player = player
    @computer_ships_sunk = 0
    @player_ships_sunk = 0
  end

  def header
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
  end

  def display_boards(computer, player)
    puts "=============COMPUTER BOARD============="
    puts @computer.board.render
    puts "==============PLAYER BOARD=============="
    puts @player.board.render(true)
  end

  def player_shot(player)
    loop do
      puts "Enter coordinate to fire upon"
      player_input = gets.chomp
      if player_input != []
        if computer.board.valid_coordinate?(player_input) == true
          if computer.board.cells[player_input].fired_upon? == false
            @computer.board.cells[player_input].fire_upon
            if computer.board.cells[player_input].render(true) == "M"
              puts "Your shot on #{player_input} was a miss."
            elsif computer.board.cells[player_input].render(true) == "H"
              puts "Your shot on #{player_input} was a hit."
            elsif computer.board.cells[player_input].render(true) == "X"
              puts "Your shot on #{player_input} sunk a ship."
              @computer_ships_sunk += 1
            end
            break
          end
        end
      end
      puts "That is not a valid coordinate. Please try again:"
    end
  end

  def computer_shot(computer)
    computer_input = player.board.cells.keys.sample
    until player.board.valid_coordinate?(computer_input) && player.board.cells[computer_input].fired_upon? == false
      computer_input = player.board.cells.keys.sample
    end
    @player.board.cells[computer_input].fire_upon
    if player.board.cells[computer_input].render(true) == "M"
      puts "Computer shot on #{computer_input} was a miss."
    elsif player.board.cells[computer_input].render(true) == "H"
      puts "Computer shot on #{computer_input} was a hit."
    elsif player.board.cells[computer_input].render(true) == "X"
      puts "Computer shot on #{computer_input} sunk a ship."
      @player_ships_sunk += 1
    end
  end
end
