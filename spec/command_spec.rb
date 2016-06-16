require 'spec_helper'
require_relative '../class/command'

describe Command do
  let(:robot) { double("robot", is_placed?: true) }
  let(:table) { double("table", inside_table?: true) }
  subject(:command) { Command.new(robot) }
  
  describe '#process' do
    context 'when processing a PLACE command' do
      let(:first_command) { 'PLACE 3,3,WEST' }

      it 'places the robot on top of a table' do
        expect(robot).to receive(:place).with('3', '3', 'WEST')
        command.process(first_command)
      end
    end

    context 'when processing an invalid PLACE command' do
      let(:first_command) { 'PLACE 2,2' }

      it 'output an invalid PLACE command' do
        expect { command.process(first_command) }.to output("PLACE command should be followed by 3 parameter separated by commas: e.g PLACE 2,2,NORTH\n").to_stdout
      end
    end

    context 'when processing a MOVE command' do
      let(:first_command) { 'MOVE' }

      it 'places move the robot one step forward from the facing' do
        expect(robot).to receive(:move)
        command.process(first_command)
      end
    end

    context 'when processing a LEFT command' do
      let(:first_command) { 'LEFT' }

      it 'turns robot\'s facing90 degrees anti clockwise' do
        expect(robot).to receive(:left)
        command.process(first_command)
      end
    end

    context 'when processing a RIGHT command' do
      let(:first_command) { 'RIGHT' }

      it 'turns robot\'s facing 90 degrees clockwise' do
        expect(robot).to receive(:right)
        command.process(first_command)
      end
    end

    context 'when processing a REPORT command' do
      let(:first_command) { 'REPORT' }

      it 'report robot\'s coordinate' do
        expect(robot).to receive(:report)
        command.process(first_command)
      end
    end

    context 'when processing an invalid command' do
      let(:first_command) { 'TEST INVALID COMMAND' }

      it 'output an invalid command' do
        expect { command.process(first_command) }.to output("Invalid command: TEST INVALID COMMAND\n").to_stdout
      end
    end

    context 'when the robot has not been placed' do
      let(:robot) { double("robot", is_placed?: false) }

      it 'ignores move command' do
        expect(robot).to_not receive(:move)
      end

      it 'ignores left command' do
        expect(robot).to_not receive(:left)
      end

      it 'ignores right command' do
        expect(robot).to_not receive(:right)
      end

      it 'ignores report command' do
        expect(robot).to_not receive(:print)
      end
    end
  end
end