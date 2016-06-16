require_relative '../class/robot'
require_relative '../class/command'

table = Table.new
robot = Robot.new(table)
command = Command.new(robot)

ARGF.each_line { |line| 
  command.process(line.strip)
}