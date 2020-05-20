require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/turn'
require './lib/board'
require './lib/cell'
require './lib/computer_player'
require './lib/game'
require './lib/human_player'

class ShipTest < Minitest::Test

  def test_it_exists
    # skip
    cruiser = Ship.new("Cruiser", 3)

    assert_instance_of Ship, cruiser
  end

  def test_it_has_attributes
    # skip
    cruiser = Ship.new("Cruiser", 3)

    assert_equal "Cruiser", cruiser.name
    assert_equal 3, cruiser.length
   end

   def test_it_has_health
    # skip
    cruiser = Ship.new("Cruiser", 3)

    assert_equal 3, cruiser.health
   end

   def test_it_has_sunk
    # skip
    cruiser = Ship.new("Cruiser", 3)

    assert_equal false, cruiser.sunk?
    cruiser.hit
    assert_equal 2, cruiser.health
    cruiser.hit
    assert_equal 1, cruiser.health
    assert_equal false, cruiser.sunk?
    cruiser.hit
    assert_equal true, cruiser.sunk?
   end
end
