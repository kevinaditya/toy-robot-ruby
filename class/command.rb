class Command
  def initialize(robot)
    @robot = robot
  end

  def process(command)
  	if command.start_with?('PLACE ')
      params = command.split.last
      if params.split(",").length == 3
        @robot.place(*params.split(","))
      else
      	puts "PLACE command should be followed by 3 parameter separated by commas: e.g PLACE 2,2,NORTH"
  	  end
	  elsif @robot.is_placed?
  	  if command == 'MOVE'
	      @robot.move
      elsif command == 'LEFT'
        @robot.left
      elsif command == 'RIGHT'
        @robot.right
      elsif command == 'REPORT'
        @robot.report
      else
        puts "Invalid command: #{command}"
      end
    else
      puts "Invalid command: #{command}"
    end
  end
end