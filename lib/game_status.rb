require "pry"
# Helper Method

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
# board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

 WIN_COMBINATIONS = [
  
  [0,1,2], #Top_Row_Win
  [3,4,5], #Middle_Across_Win
  [0,3,6], #Left_Down_Win 
  [2,5,8], #Left_Down_Win
  [6,7,8], #Bottom_Row_Win
  [0,4,8], #Right_Diagonal_Win
  [1,4,7], #Middle_Down_Win
  [2,4,6] #Middle_Down_Left
]



def won?(board)
  WIN_COMBINATIONS.each do |combination|
    p1 = board[combination[0]]
    p2 = board[combination[1]]
    p3 = board[combination[2]]
    
    if position_taken?(board, combination[0]) && p1 == p2 && p2 == p3
      return combination
    end
  end
  false
end



def full?(board)
  board.each do |index|
    if index != " "  
     true
    else
      return false
    end
  end
end


def draw?(board) 
  full?(board) && !won?(board)
end


def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if over?(board) 
    combination = won?(board)
    board[combination.first]
  else
    nil 
  end
end
