
class Sudoku

  def initialize(string)
    str = string.split("")
    p str.each_slice(9) {|s| p s }
    @board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]] 
  end

  
  # def to_s
  #   @board.each do |row|
  #     3.times do 
  #         row.each do |element|
  #       print " #{element}|  "
  #     end
  #   end   
  #     puts
  #   end 
  # end
end

game = Sudoku.new("702806519100740230005001070008000002610204053200000100070400800064078005821503907")
game
