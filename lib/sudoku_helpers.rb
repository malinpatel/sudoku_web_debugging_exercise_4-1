require_relative 'cell'
require_relative 'sudoku'
require 'sinatra/base'

module SudokuHelpers

  def get_solved_sudoku_cells(starting_puzzle_string)
    solved_sudoku = Sudoku.new(starting_puzzle_string)
    solved_sudoku.solve!
    solved_sudoku.cells
  end

  def convert_values_array_to_string(values_array)
    values_array.map {|x| x == "" ? "0" : x}.join
  end

  def problem_solved?(user_sudoku, original_puzzle)    
    sudoku_puzzle = Sudoku.new(original_puzzle)
    sudoku_puzzle.solve!
    sudoku_puzzle.to_s == user_sudoku
  end

  def end_of_row?(index)
    (index % 9 == 0) && (index != 0)
  end

end
