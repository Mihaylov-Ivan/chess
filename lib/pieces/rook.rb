require_relative 'transformations.rb'

class Rook
    include Transformations

    attr_reader :current_position, :all_available_movements :available_movement_left, :available_movement_right, :available_movement_up, :available_movement_down

    def initialize(colour, number, current_position)
        @colour = colour
        @number = number
        @current_position = current_position
        colour == white ? @symbol = '♖' : @symbol = '♜'
        get_available_movement
    end

    def get_available_movement
        @available_movement_left = []
        @available_movement_right = []
        @available_movement_up = []
        @available_movement_down = []
        current_square_number = current_position.split("")[0].to_i
        current_square_letter = current_position.split("")[1].upcase

        (1...current_square_number).to_a.reverse.each do |i|
            available_movement_down << [i, letters_to_numbers[current_square_letter]]
        end
        (current_square_number+1..8).each do |i|
            available_movement_up << [i, letters_to_numbers[current_square_letter]]
        end
        ('A'...current_square_letter).to_a.reverse.each do |l|
            available_movement_left << [current_square_number, letters_to_numbers[letter]]
        end
        (current_square_letter..'H').each do |l|
            available_movement_right << [current_square_number, letters_to_numbers[letter]]
        end
        available_movement_right.drop(1)

        # @all_available_movements = available_movement_down+available_movement_left+available_movement_right+available_movement_up
    end

    # def available_position?(position)
    #     # return false unless all_available_movements.include?(position)
    #     @all_available_movements
    #     available_movement_left.each do |position|
    #         boa

    #     end
    # end
end
