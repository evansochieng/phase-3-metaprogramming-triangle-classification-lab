class Triangle
  # write code here

  #initialize sides
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  # Triangle.kind method
  #check if the triengle is valid, then assign appropriate kind, otherwise raise error
  def kind
    side_validity = (@side1 > 0 && @side2 > 0 && @side3 > 0) #sides greater than 0

    # check if sum of the lengths of any two sides exceeds the length of the third side
    sum_side12_3 = (@side1 + @side2) > @side3
    sum_side13_2 = (@side1 + @side3) > @side2
    sum_side23_1 = (@side2 + @side3) > @side1
    sum_sides_validity = (sum_side12_3 && sum_side13_2 && sum_side23_1)

    # Assign kind or raise error
    if side_validity && sum_sides_validity #triangle is valid
      case true
      when @side1 == @side2 && @side2 == @side3 #all sides equal
        :equilateral
      when @side1 == @side2 || @side1 == @side3 || @side2 == @side3 #two sides equal
        :isosceles
      else #all sides unequal
        :scalene
      end
    else # triangle invalid
      raise TriangleError
    end
  end

  # Define the TriangleError for invalid traingles
  class TriangleError < StandardError
    #this is my custom error for invalid triangles
  end
end


# Test code
t1 = Triangle.new(2, 2, 2)
puts t1.kind