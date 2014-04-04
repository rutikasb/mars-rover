require "#{Dir.pwd}/lib/plateau"
require "#{Dir.pwd}/lib/rover"

describe Rover do

  before :each do
    @plateau = Plateau.new "5 5\n1 2 N\nLMLMLMLMM 3 3 E MMRMMRMRRM"
  end

  it "should turn left when input is 'L'" do
    @rover = Rover.new '1', '2', 'N', 'L', @plateau
    @rover.move
    @rover.state["dir"].should == 'W'
  end

  it "should turn right when input is 'R'" do
    @rover = Rover.new '1', '2', 'N', 'R', @plateau
    @rover.move
    @rover.state["dir"].should == 'E'
  end

  it "should move forward when input is 'M'" do
    @rover = Rover.new '1', '2', 'E', 'M', @plateau
    @rover.move
    @rover.state["x"].should == 2
    @rover.state["y"].should == 2
  end

  it "should not let the rover move out of the plateau" do
    @rover = Rover.new '1', '2', 'N', 'MMMMMRMMMMM', @plateau
    @rover.move
    @rover.state["x"].should == 5
    @rover.state["y"].should == 5
    @rover.state["dir"].should == 'E'

    @rover = Rover.new '3', '2', 'E', 'MMMMMLMMMMM', @plateau
    @rover.move
    @rover.state["x"].should == 5
    @rover.state["y"].should == 5
    @rover.state["dir"].should == 'N'
  end
end
