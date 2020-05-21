require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/board'
require './lib/cell'
require './lib/computer_player'
require './lib/game'
require './lib/human_player'
require './lib/ship'
require './lib/board'
require './lib/cell'

class TurnTest < Minitest::Test

  def test_it_exists
    computer_player = ComputerPlayer.new
    human_player = HumanPlayer.new
    turn = Turn.new(computer_player, human_player)

    assert_instance_of Turn, turn
  end

  def test_it_has_attributes
    computer_player = ComputerPlayer.new
    human_player = HumanPlayer.new
    turn = Turn.new(computer_player, human_player)

    assert_equal computer_player, turn.computer
    assert_equal human_player, turn.player
    assert_equal 0, turn.computer_ships_sunk
    assert_equal 0, turn.player_ships_sunk
  end

  # def test_it_has_a_header
  #
  # end
  #
  # def test_it_can_display_boards
  #
  # end

  def test_it_has_a_player_shot
    computer_player = ComputerPlayer.new
    human_player = HumanPlayer.new
    turn = Turn.new(computer_player, human_player)
    turn.player_shot
  end


end
