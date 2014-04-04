class Rover
  attr_accessor :state

  def initialize(x_coor, y_coor, direction, moves, plateau)
    @moves = moves

    @state = {
      "dir" => direction,
      "x" => x_coor.to_i,
      "y" => y_coor.to_i
    }

    @plateau = plateau
  end

  def move
    @moves.split("").each do |action|
      case action
      when 'L'
        turn_left
      when 'R'
        turn_right
      when 'M'
        move_forward
      end
    end
    print_state
  end

  def print_state
    puts "#{@state["x"]} #{@state["y"]} #{@state["dir"]}"
  end

private

  def turn_right
    dir = nil
    case @state["dir"]
    when 'N'
      dir = 'E'
    when 'E'
      dir = 'S'
    when 'S'
      dir = 'W'
    when 'W'
      dir = 'N'
    end

    @state["dir"] = dir
  end

  def turn_left
    dir = nil
    case @state["dir"]
    when 'N'
      dir = 'W'
    when 'E'
      dir = 'N'
    when 'S'
      dir = 'E'
    when 'W'
      dir = 'S'
    end

    @state["dir"] = dir
  end

  def move_forward
    x, y = nil
    case @state["dir"]
    when 'N'
      x, y = [0, 1]
    when 'S'
      x, y = [0, -1]
    when 'E'
      x, y = [1, 0]
    when 'W'
      x, y = [-1, 0]
    end

    new_x = @state["x"] + x
    new_y = @state["y"] + y

    if @plateau.valid_coordinates?(new_x, new_y)
      @state["x"] = new_x
      @state["y"] = new_y
    end
  end
end
