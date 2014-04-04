require "#{Dir.pwd}/lib/rover"

class Plateau
  attr_accessor :plateau_height, :plateau_width, :rovers

  def initialize(input)
    @input = input.split
    @rovers = Array.new

    @plateau_width = @input.slice!(0).to_i
    @plateau_height = @input.slice!(0).to_i
    parse_rovers
  end

  # Moves the rovers according to the given instructions
  def move_rovers
    @rovers.each do |rover|
      rover.move
    end
  end

  # Checks if the given position (to which the rover should move) is within the
  # bounds of the plateau
  def valid_coordinates?(x, y)
    (x >= 0 and x <= @plateau_width) and (y >= 0 and y <= @plateau_height)
  end

private

  def parse_rovers
    @input.each_slice(4) do |x, y, direction, moves|
      @rovers << Rover.new(x, y, direction, moves, self)
    end
  end
end
