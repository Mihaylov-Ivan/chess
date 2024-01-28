class Pawn



    def initialize(colour, number, current_position)
        @colour = colour
        @number = number
        @current_position = current_position
        @available_movement = get_available_movement
        colour == white ? @symbol = '♙' : @symbol = '♟︎'
    end

    def get_available_movement
        @available_movement_left = []
        @available_movement_right = []
        @available_movement_up = []
        @available_movement_down = []
        current_square_number = current_position.split("")[0].to_i
        current_square_letter = current_position.split("")[1].upcase

        (1...current_square_number).each do |i|
            available_movement_down << "#{current_square_letter}#{i}"
        end
        (current_square_number..8).each do |i|
            available_movement_up << "#{current_square_letter}#{i}"
        end
        ('A'...current_square_letter).each do |l|
            available_movement_left << "#{l}#{current_square_number}"
        end
        (current_square_letter..'H').each do |l|
            available_movement_right << "#{l}#{current_square_number}"
        end

    end

    def get_available_positions(*args)

    end

    def available_position?(position)

    end
end
