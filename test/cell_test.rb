require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def test_it_exists
    # skip
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end

  def test_it_has_a_coordinate
    # skip
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
   end

  def test_it_is_empty
    # skip
    cell = Cell.new("B4")

    assert_nil nil, cell.ship
    assert_equal true, cell.empty?
   end

   def test_it_can_place_ship
    # skip
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    assert_instance_of Ship, cell.ship
    assert_equal false, cell.empty?
   end

   def test_fired_upon_starts_as_false
     cell = Cell.new("B4")

     assert_equal false, cell.fired_upon?
   end

   def test_it_can_be_fired_upon
     cell = Cell.new("B4")

     assert_equal false, cell.fired_upon?

     cell.fire_upon

     assert_equal true, cell.fired_upon?
   end

   def test_if_fired_upon_it_hits_ship
     cell = Cell.new("B4")
     cruiser = Ship.new("Cruiser", 3)

     cell.place_ship(cruiser)

     assert_equal 3, cell.ship.health

     cell.fire_upon

     assert_equal true, cell.fired_upon?
     assert_equal 2, cell.ship.health
   end
end
