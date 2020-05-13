class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    if @ship == nil
      return true
    else
      return false
    end
  end

  def place_ship(ship_to_place)
    @ship = ship_to_place
  end

  def fire_upon
    ship.hit if @ship
    @fired_upon = true
  end

  def fired_upon?
    @fired_upon
  end
end
