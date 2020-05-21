require './lib/ship'
require './lib/cell'

class Board
  attr_reader :cells
  def initialize
    @cells = {
      "A1" => Cell.new("A1"), "A2" => Cell.new("A2"), "A3" => Cell.new("A3"), "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"), "B2" => Cell.new("B2"), "B3" => Cell.new("B3"), "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"), "C2" => Cell.new("C2"), "C3" => Cell.new("C3"), "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"), "D2" => Cell.new("D2"), "D3" => Cell.new("D3"), "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    cells.keys.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    answer = true
    answer = false if !are_coordinates_ship_length?(ship, coordinates)
    answer = false if contains_ship?(coordinates)
    return false if coordinates.empty?
    i = 0
    until i == coordinates.size - 1
      if are_coordinates_same_letter?(ship, coordinates)
        answer = false unless are_coordinate_nums_consecutive?(ship, coordinates, i)
      else
        if !are_coordinate_letters_consecutive?(ship, coordinates, i)
          answer = false
        else
          if coordinates[i][1] != coordinates[i + 1][1]
            answer = false
          end
        end
      end
      i += 1
    end
    answer
  end

  def are_coordinates_ship_length?(ship, coordinates)
    coordinates.size == ship.length
  end

  def are_coordinates_same_letter?(ship, coordinates)
    letters = coordinates.map do |coordinate|
      coordinate[0]
    end
    true if letters.uniq.size == 1
  end

  def are_coordinate_nums_consecutive?(ship, coordinates, iterate)
    (coordinates[iterate][1].to_i + 1) == coordinates[iterate + 1][1].to_i
  end

  def are_coordinate_letters_consecutive?(ship, coordinates, iterate)
    (coordinates[iterate][0].ord + 1) == coordinates[iterate + 1][0].ord
  end

  def are_coordinate_nums_same?(ship, coordinates, iterate)
    coordinates[iterate][1] == coordinates[iterate + 1][1]
  end

  def contains_ship?(coordinates)
    answer = false
    coordinates.each do |coordinate|
      answer = true if @cells[coordinate].empty? == false
    end
    answer
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        if valid_coordinate?(coordinate)
          @cells[coordinate].place_ship(ship)
        end
      end
    end
  end

  def render(display_ship = false)
    "  1 2 3 4 \n" +
    "A #{@cells["A1"].render(display_ship)} #{@cells["A2"].render(display_ship)} #{@cells["A3"].render(display_ship)} #{@cells["A4"].render(display_ship)} \n" +
    "B #{@cells["B1"].render(display_ship)} #{@cells["B2"].render(display_ship)} #{@cells["B3"].render(display_ship)} #{@cells["B4"].render(display_ship)} \n" +
    "C #{@cells["C1"].render(display_ship)} #{@cells["C2"].render(display_ship)} #{@cells["C3"].render(display_ship)} #{@cells["C4"].render(display_ship)} \n" +
    "D #{@cells["D1"].render(display_ship)} #{@cells["D2"].render(display_ship)} #{@cells["D3"].render(display_ship)} #{@cells["D4"].render(display_ship)} \n"
  end
end
