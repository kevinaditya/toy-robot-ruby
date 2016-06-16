class Table
  def initialize(height = 5, width = 5)
    @height = height
    @width = width
  end

  def inside_table?(x, y)
    (y >= 0 && y < @height) && (x >= 0 && x < @width)
  end
end
