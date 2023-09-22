class King

    def initialize(colour, current_position)
        @colour = colour
        @current_position = current_position
        @available_movement = get_available_movement
        colour == white ? @symbol = '♔' : @symbol = '♚'
    end
end
