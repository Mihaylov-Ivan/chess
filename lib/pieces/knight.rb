class Knight

    def initialize(colour, number, current_position)
        @colour = colour
        @number = number
        @current_position = current_position
        @available_movement = get_available_movement
        colour == white ? @symbol = '♘' : @symbol = '♞'
    end
end
