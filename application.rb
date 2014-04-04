require "#{Dir.pwd}/lib/plateau"

#
# Problem:
# Given a robotic rover and it's initial position on a plateau,
# We have to move the rover around the plateau according to given directions
# and find it's final position on the plateau
#
class Application
  def run
    input = $stdin.read
    plateau = Plateau.new input

    plateau.move_rovers
  end
end
