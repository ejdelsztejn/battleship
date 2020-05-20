require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/turn'
require './lib/computer_player'
require './lib/game'
require './lib/human_player'

class HumanPlayerTest < Minitest::Test

  def test_it_exists
    human_player = HumanPlayer.new

    assert_instance_of HumanPlayer, human_player
  end

  def test_it_has_a_board
    human_player = HumanPlayer.new

    assert_instance_of Board, human_player.board
  end

  def test_it_has_ships
    human_player = HumanPlayer.new

    assert_instance_of Ship, human_player.cruiser
    assert_instance_of Ship, human_player.submarine
  end

  def test_it_can_set_up_cruiser
    skip
    human_player = HumanPlayer.new
    human_player.set_up_cruiser

    assert_equal [@cells, @cells, @cells], @board.place
    # Error: HumanPlayerTest#test_it_can_set_up_cruiser:
    # NoMethodError: undefined method `place' for nil:NilClass
    # test/human_player_test.rb:36:in `test_it_can_set_up_cruiser'
  end

  def test_it_can_set_up_submarine
    human_player = HumanPlayer.new
    human_player.set_up_submarine

    assert_equal [@cells, @cells], @board.place
    #Error: HumanPlayerTest#test_it_can_set_up_submarine:
    # NoMethodError: undefined method `place' for nil:NilClass
    # test/human_player_test.rb:47:in `test_it_can_set_up_submarine'
  end
end
