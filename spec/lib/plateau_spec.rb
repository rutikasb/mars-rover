require "#{Dir.pwd}/lib/plateau"

describe Plateau do
  let (:input) { "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM" }

  before :each do
    @plateau = Plateau.new input
  end

  it "should set the upper-right coordinates of the plateau" do
    @plateau.plateau_height.should == 5
    @plateau.plateau_width.should == 5
  end

  it "should create rovers with initial state" do
    @plateau.rovers.count.should == 2
    @plateau.rovers[0].state.should == {"x" => 1, "y" => 2, "dir" => 'N'}
    @plateau.rovers[1].state.should == {"x" => 3, "y" => 3, "dir" => 'E'}
  end

  it "should move the rovers around" do
    @plateau.move_rovers
    @plateau.rovers[0].state.should == {"x" => 1, "y" => 3, "dir" => 'N'}
    @plateau.rovers[1].state.should == {"x" => 5, "y" => 1, "dir" => 'E'}
  end

end
