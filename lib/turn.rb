class Turn
  def initialize
    @computer = computer
    @player = player
  end

  def display_boards(computer, player)
    # Displaying boards
    puts "=============COMPUTER BOARD============="
    puts @computer.board.render
    puts "==============PLAYER BOARD=============="
    puts @player.board.render(true)
  end

  def player_shot(player)
    loop do
      puts "Enter coordinate to fire upon"
      player_input = gets.chomp
      if computer.board.valid_coordinate?(player_input) == true
        if computer.board.cells[player_input].fired_upon? == false
          @computer.board.cells[player_input].fire_upon
          if computer.board.cells[player_input].render(true) == "M"
            puts "Your shot on #{player_input} was a miss."
          elsif computer.board.cells[player_input].render(true) == "H"
            puts "Your shot on #{player_input} was a hit."
          elsif computer.board.cells[player_input].render(true) == "X"
            puts "Your shot on #{player_input} sunk the a ship."
          end
          break
        end
      end
      puts "That is not a valid coordinate. Please try again:"
    end
  end

  def computer_shot(computer)
    computer_input = player.board.cells.keys.sample
    if player.board.valid_coordinate?(computer_input) == true
      if computer.board.cells[player_input].fired_upon? == false
        @player.board.cells[computer_input].fire_upon
        if player.board.cells[computer_input].render(true) == "M"
          puts "Computer shot on #{computer_input} was a miss."
        elsif player.board.cells[computer_input].render(true) == "H"
          puts "Computer shot on #{computer_input} was a hit."
        elsif player.board.cells[computer_input].render(true) == "X"
          puts "Computer shot on #{computer_input} sunk a ship."
        end
      end
    end
  end
end
