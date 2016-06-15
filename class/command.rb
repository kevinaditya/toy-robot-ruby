class Command
  def initialize(robot)
    @robot = robot
  end

  def process(command)
  	if command.start_with?('PLACE')
      params = command.split.last
      @robot.place(*params.split(","))
    elsif command == 'REPORT'
      @robot.report()
    end
  end
end