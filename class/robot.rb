require_relative 'table'

class Robot
  attr_reader :x, :y, :facing

  def initialize(table)
    @table = table
  end

  def place(x, y, facing)
  	if @table.inside_table?(x.to_i, y.to_i)
      @x = x.to_i
      @y = y.to_i
      @facing = facing.to_s
    end
  end

  def move
    case @facing 
    when 'NORTH'
   	  if @table.inside_table?(@x, @y+1)
        @y = @y + 1
      end
	when 'EAST'
	  if @table.inside_table?(@x+1, @y)
	    @x = @x + 1
	end
    when 'SOUTH'
      if @table.inside_table?(@x, @y-1)
        @y = @y - 1 
      end
    when 'WEST'
      if @table.inside_table?(@x-1, @y)
          @x = @x - 1
      end
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

  def report
  	puts "Output: #{@x},#{@y},#{@facing}"
  end

  def is_placed?
    !(@x.nil? && @y.nil?)
  end

end