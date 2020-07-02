require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/computer_player'
require './lib/turn'
require './lib/game'
require './lib/human_player'

class ComputerPlayerTest < Minitest::Test

  def test_it_exists
    computer_player = ComputerPlayer.new
    board = Board.new

    assert_instance_of ComputerPlayer, computer_player
  end

  def test_it_has_a_board
    computer_player = ComputerPlayer.new
    board = Board.new

    assert_instance_of Board, computer_player.board
  end

  def test_it_has_ships
    computer_player = ComputerPlayer.new
    board = Board.new

    assert_instance_of Ship, computer_player.cruiser
    assert_instance_of Ship, computer_player.submarine
  end

  def test_it_can_set_up_cruiser
    computer_player = ComputerPlayer.new
    board = Board.new
    computer_player.set_up_cruiser

    assert_equal [@cell, @cell, @cell], computer_player.board.place
  end

  def test_it_can_set_up_submarine
    skip
    omputer_player = ComputerPlayer.new
    board = Board.new
    computer_player.set_up_submarine

    assert_equal [@cell, @cell], computer_player.board.place
  end

end
