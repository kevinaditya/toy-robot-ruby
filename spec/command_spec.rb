require 'spec_helper'
require_relative '../class/command'

describe Command do
  let(:robot) { double("robot", is_placed?: true) }
  subject(:command) { Command.new(robot) }
  
  describe '#process' do
    context 'when processing a PLACE command' do
      let(:first_command) { 'PLACE 3,3,WEST' }

      it 'places the robot on top of a table' do
        expect(robot).to receive(:place).with('3', '3', 'WEST')
        command.process(first_command)
      end
    end

    context 'when processing a MOVE command' do
      let(:first_command) { 'MOVE' }

      it 'places the robot on top of a table' do
        expect(robot).to receive(:move)
        command.process(first_command)
      end
    end

    context 'when processing a LEFT command' do
      let(:first_command) { 'LEFT' }

      it 'places the robot on top of a table' do
        expect(robot).to receive(:left)
        command.process(first_command)
      end
    end

    context 'when processing a RIGHT command' do
      let(:first_command) { 'RIGHT' }

      it 'places the robot on top of a table' do
        expect(robot).to receive(:right)
        command.process(first_command)
      end
    end

    context 'when processing a REPORT command' do
      let(:first_command) { 'REPORT' }

      it 'places the robot on top of a table' do
        expect(robot).to receive(:report)
        command.process(first_command)
      end
    end

    context 'when the robot has not been placed' do
      let(:robot) { double("robot", is_placed?: false) }

      it 'ignores move command' do
        expect(robot).to_not receive(:move)
        command.process('MOVE')
      end

      it 'ignores left command' do
        expect(robot).to_not receive(:left)
        command.process('LEFT')
      end

      it 'ignores right command' do
        expect(robot).to_not receive(:right)
        command.process('RIGHT')
      end

      it 'ignores report command' do
        expect(command).to_not receive(:puts)
        command.process('REPORT')
      end
    end
  end
end