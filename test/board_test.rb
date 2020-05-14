
class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new

    assert_instance_of Board, board 
  end

  def test_it_has_cells


    assert_equal Hash, board.cells.class
    assert_equal 16, board.cells.length
  end
end
