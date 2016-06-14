require 'spec_helper'
require_relative '../class/command'

describe Command do
  let(:robot) { double("robot") }
  subject(:command) { Command.new(robot) }
  
  describe '#process' do
    context 'when processing a PLACE command' do
      let(:first_command) { 'PLACE 3,3,WEST' }

      it 'places the robot on top of a table' do
        expect(robot).to receive(:place).with('3', '3', 'WEST')
        command.process(first_command)
      end
    end
  end
end