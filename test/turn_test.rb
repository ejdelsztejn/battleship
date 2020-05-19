require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/board'
require './lib/cell'
require './lib/computer_player'
require './lib/game'
require './lib/human_player'
require './lib/ship'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new

    assert_instance_of Turn, turn
  end

  

end
