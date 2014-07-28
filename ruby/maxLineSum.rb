=begin

Given a triangle with n rows, find the maximum total sum for a path leading from the topmost node to the bottom row.

For example:

5
9 6
4 6 8
0 7 1 5

Max sum = 27

=end

$tri = Array.new

# If given a text file
# File.foreach('file.txt') {|x|
#     $tri << x.split(" ").map(&:to_i)
# }

$tri = [[5],[9,6],[4,6,8],[0,7,1,5]]
  
def maxLine(t)
  (t.length-2).downto(0) { |r|
    for c in 0..r
      # replace each node with max sum of it's children
      leftSum = t[r][c] + t[r+1][c]
      rightSum = t[r][c] + t[r+1][c+1]
      t[r][c] = [ leftSum, rightSum ].max
    end
    t.slice(0..r) # cut last row
  }
  puts t[0][0] # last remaining max sum
end

maxLine($tri)