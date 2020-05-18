class HumanPlayer
  
end

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
