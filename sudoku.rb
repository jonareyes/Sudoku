 
class Sudoku

  def initialize(string)
    str = string.split("")
    p str.each_slice(9) {|s| p s }
    @board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]] 
  end

  
  def to_s
    @board.each do |row|
      3.times do 
          row.each do |element|
        print " #{element}|  "
      end
    end   
      puts
    end 
  end
end

game = Sudoku.new("702806519100740230005001070008000002610204053200000100070400800064078005821503907")
game

# ========================================================

class Sudoku



@@boxes =[
        [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]],
        [[0,3],[0,4],[0,5],[1,3],[1,4],[1,5],[2,3],[2,4],[2,5]],
        [[0,6],[0,7],[0,8],[1,6],[1,7],[1,8],[2,6],[2,7],[2,8]],
        [[3,0],[3,1],[3,2],[4,0],[4,1],[4,2],[5,0],[5,1],[5,2]],
        [[3,3],[3,4],[3,5],[4,3],[4,4],[4,5],[5,3],[5,4],[5,5]],
        [[3,6],[3,7],[3,8],[4,6],[4,7],[4,8],[5,6],[5,7],[5,8]],
        [[6,0],[6,1],[6,2],[7,0],[7,1],[7,2],[8,0],[8,1],[8,2]],
        [[6,3],[6,4],[6,5],[7,3],[7,4],[7,5],[8,3],[8,4],[8,5]],
        [[6,6],[6,7],[6,8],[7,6],[7,7],[7,8],[8,6],[8,7],[8,8]]]

@@posibilities = (1..9).to_a.map!{|x| x.to_s}


  @@range_numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  # @@box1 = [[0, 0],[0, 1],[0, 2],[1, 0],[1, 1],[1, 2],[2, 0],[2, 1],[2, 2]]
  def initialize(numbers)
    @str = numbers
    @words = @str.gsub(/["0"]/){ |x| (" ") }
    @array_words = @words.scan(/.{9}/).map!{|row| row.split("")}
    @flag = " "
  end

  def to_s
    @array_words.each do |word|
      print word
      print "\n"  
    end
    ""
  end

  def solve_board
    p position  = first_blank_position(@flag)

    while position
      find_posibilities(position)
      p @array_words
      position = first_blank_position(@flag)
    end

  end

  def find_posibilities(position)
    row = get_row(position[:pos_x ])
    col =  get_col(position[:pos_y])
    box_index = get_box(position[:pos_x ], position[:pos_y])
    box = @@boxes[box_index]
    find_positions_in_box(box)
    posibles = @@posibilities - (row + col + box).uniq 
    if posibles.count == 1
     @array_words[ position[:pos_x ] ][position[:pos_y]] = posibles[0]
    else
     @array_words[ position[:pos_x ] ][position[:pos_y]] = "X"
    end
  end

  def first_blank_position(flag)    
    @array_words.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        if col == flag
          return {pos_x:row_index , pos_y:col_index}
        end
      end
    end
    if @array_words.flatten.include?("X")
     @array_words
     puts "acabe primera vuelta" 
    end
    false
  end


  def get_row(row_num)
    array_row = @array_words[row_num]
    array_row
  end

  def get_col(col_num)
    array_col = @array_words.transpose[col_num]
    array_col 
  end

  def get_box(row_num, col_num)
    real_position = [row_num, col_num]
    @@boxes.each_with_index do |caja, box_index|
      caja.each do |position|
      return box_index  if real_position == position
      end
    end
  end

  def find_position(position)
    row_index_to_find = position[0]
    col_index_to_find = position[1]
    @array_words.each_with_index do |row,row_index|
      row.each_with_index do |element, col_index|
      return element if col_index == col_index_to_find && row_index == row_index_to_find
      end
    end   
  end

  def find_positions_in_box(box)
    box.map do |position| 
      find_position(position)
    end   
  end


  # def get_box(row_num, col_num)
  #   box_array = []
  #   str_position = row_num.to_s + col_num.to_s
  #   @@box1.each do |box|
  #     box_array << box.join
  #   end
  #   box_array.each_with_index do |element, index|
  #     if str_position == element
  #       return index-1
  #     end
  #   end
  # end
end


#Driver code
game = Sudoku.new('702806519100740230005001070008000002610204053200000100070400800064078005821503907')

puts game

game.solve_board


