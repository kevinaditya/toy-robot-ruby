require 'spec_helper'
require_relative '../class/robot'

describe Robot do
  let(:robot) { Robot.new }

  describe 'placing a robot on the tabletop' do
    before do 
      robot.place(0, 0, 'NORTH') 
    end

    it 'sets the x coordinate' do
      expect(robot.x).to be 0
    end

    it 'sets the y coordinate' do
      expect(robot.y).to be 0
    end

    it 'set the robot\'s facing' do
      expect(robot.facing).to eq 'NORTH'
    end
  end
end