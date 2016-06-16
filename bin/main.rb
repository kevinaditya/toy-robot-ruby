require_relative '../class/robot'
require_relative '../class/command'

table = Table.new

puts "Sample test 1"
robot1 = Robot.new(table)
command = Command.new(robot1)
puts "PLACE 0,0,NORTH"
command.process("PLACE 0,0,NORTH")
puts "MOVE"
command.process("MOVE")
puts "REPORT"
command.process("REPORT")
puts "\n"

puts "Sample test 2"
robot2 = Robot.new(table)
command = Command.new(robot2)
puts "PLACE 0,0,NORTH"
command.process("PLACE 0,0,NORTH")
puts "LEFT"
command.process("LEFT")
puts "REPORT"
command.process("REPORT")
puts "\n"

puts "Sample test 3"
robot3 = Robot.new(table)
command = Command.new(robot3)
puts "PLACE 1,2,EAST"
command.process("PLACE 1,2,EAST")
puts "MOVE"
command.process("MOVE")
puts "MOVE"
command.process("MOVE")
puts "LEFT"
command.process("LEFT")
puts "MOVE"
command.process("MOVE")
puts "REPORT"
command.process("REPORT")
puts "\n"

#Now try it yourself
puts "Now you can start with your own robot!"

robot = Robot.new(table)
command = Command.new(robot)

ARGF.each_line { |line| 
  command.process(line.strip)
}