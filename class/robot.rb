class Robot
  attr_reader :x, :y, :facing

  def place(x, y, facing)
    @x = x
    @y = y
    @facing = facing
  end

  def move
    case @facing 
    when 'NORTH'
      @y = @y + 1
	when 'EAST'
	  @x = @x + 1
    when 'SOUTH'
      @y = @y - 1 
    when 'WEST'
      @x = @x - 1
    end
  end

  def left
    case @facing 
    when 'NORTH'
      @facing = 'WEST'
    when 'EAST'
      @facing = 'NORTH'
    when 'SOUTH'
      @facing = 'EAST'
    when 'WEST'
      @facing = 'SOUTH'
    end
  end

  def right
    case @facing 
    when 'NORTH'
      @facing = 'EAST'
    when 'EAST'
      @facing = 'SOUTH'
    when 'SOUTH'
      @facing = 'WEST'
    when 'WEST'
      @facing = 'NORTH'
    end
  end
end