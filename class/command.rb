class Command
  def initialize(robot)
    @robot = robot
  end

  def process(command)
  	if command.start_with?('PLACE')
      params = command.split.last
      @robot.place(*params.split(","))
	elsif @robot.is_placed?
	  if command == 'MOVE'
	    @robot.move
      elsif command == 'LEFT'
        @robot.left
      elsif command == 'RIGHT'
        @robot.right
      elsif command == 'REPORT'
        @robot.report
      end
    end
  end
end