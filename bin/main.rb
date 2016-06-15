require_relative '../class/robot'
require_relative '../class/command'

robot = Robot.new
command = Command.new(robot)

ARGF.each_line { |line| 
  command.process(line.strip)
}