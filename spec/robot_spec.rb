require 'spec_helper'
require_relative '../class/robot'

describe Robot do
  let(:table) { double("table", inside_table?: true) }
  let(:robot) { Robot.new(table) }

  it 'has not been placed yet' do
    expect(robot.is_placed?).to be false
  end

  describe 'placing a robot on the tabletop' do
    before do 
      robot.place(0, 0, 'NORTH') 
    end

    it 'has been placed' do
      expect(robot.is_placed?).to be true
    end

    it 'sets the x coordinate' do
      expect(robot.x).to be 0
    end

    it 'sets the y coordinate' do
      expect(robot.y).to be 0
    end

    it 'sets the robot\'s facing' do
      expect(robot.facing).to eq 'NORTH'
    end

    context 'when using paramters need to be converted' do
      before do
        robot.place('1', '2', :NORTH)
      end

      it 'sets the x coordinate' do
        expect(robot.x).to be 1
      end

      it 'sets the y coordinate' do
        expect(robot.y).to be 2
      end

      it 'sets the robot\'s facing' do
        expect(robot.facing).to eq 'NORTH'
      end
    end
  end

  context 'when trying to place the robot outside the table' do
    before do 
      robot.place(6, 6, 'NORTH')
      allow(table).to receive(:inside_table?).and_return(false)
    end

    it 'fails to place the robot' do
      expect(table.inside_table?).to be false
    end
  end

  context 'when the robot has already been placed' do
    let(:facing) { 'NORTH' }

    before do
      robot.place(3, 4, facing)
    end

    describe '#move' do
      it 'moves the robot one step forward' do
        expect { robot.move }.to change { robot.y }.by(1)
      end

      context 'when the robot is going to be outside the table' do
        before do 
          allow(table).to receive(:inside_table?).and_return(false)
        end

        it 'fails to move the robot' do
          expect { robot.move }.to_not change { robot.y }
        end
      end

      context 'when the robot facing east' do
        let(:facing) { 'EAST' }

        it 'moves the robot one step in the direction of facing' do
          expect { robot.move }.to change { robot.x }.by(1)
        end
      end   

      context 'when the robot is going to be outside the table' do
        before do 
          allow(table).to receive(:inside_table?).and_return(false)
        end

        it 'fails to move the robot' do
          expect { robot.move }.to_not change { robot.x }
        end
      end   
    end

    describe '#left' do
      it 'turns the robot to the left' do
        robot.left
        expect(robot.facing).to eq 'WEST'
      end
    end

    describe '#right' do
      it 'turns the robot to the right' do
        robot.right
        expect(robot.facing).to eq 'EAST'
      end
    end

    describe '#report' do
      it 'display the robot coordinate' do
        expect { robot.report }.to output("Output: 3,4,NORTH\n").to_stdout
      end
    end
  end
end