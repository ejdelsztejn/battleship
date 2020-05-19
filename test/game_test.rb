require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new.start
    computer = Board.new
    player = Board.new

    assert_instance_of Game, game
  end

  def test_it_has_boards
    computer_board = Board.new
    player_board = Board.new

    assert_instance_of Board, computer_board
    assert_instance_of Board, player_board
  end
end
