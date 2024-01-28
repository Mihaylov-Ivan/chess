require_relative 'display.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'transformations.rb'

class Gameplay
    include Display
    include Transformations

    attr_reader :board
    attr_accessor :player1, :player2, :current_player, :game_over

    def initialize
        @board = Board.new
        @game_over = false
    end

    def play
        game_setup
        instructions
        board.show
        play_turns
    end

    def validate_move(move)
        check_move_input(move)

        start_position = [move.split[0].split('')[0].to_i, letters_to_numbers[move.split[0].split('')[1].upcase]]
        end_position = [move.split[1].split('')[0].to_i, letters_to_numbers[move.split[1].split('')[1].upcase]]

        piece = board.board[start_position[0], start_position[1]]

        # if no piece on start location
        if piece == board.white_square || piece == board.black_square
            show_move_error
            validate_move(gets.chomp)
        end

        # if end position not allowed for piece
        if not board.available_position?(piece, end_position)
            show_move_error
            validate_move(gets.chomp)
        end

        move
    end

    def check_move_input(move)
        return move if move.match?(/\A[1-8][A-Ha-h] [1-8][A-Ha-h]\z/)

        show_input_error
        check_move_input(gets.chomp)
    end

    def game_setup
        @player1 = Player.new('White')
        @player2 = Player.new('Black')

        ('A'..'H').each do |l|
            available_movement_left << "#{l}#{current_square_number}"
        end

        8.times {Pawn.new('White', '2A')}
    end

    def switch_current_player
        current_player == player1 ? @current_player = player2 : @current_player = player1
    end

    def play_turns
        @current_player = player1
        until game_over do
            player_turn_prompt(current_player.colour)
            move = validate_move(gets.chomp)

            puts move

            # board.update(move, current_player.symbol)
            # board.show
            # check_game_over
            # switch_current_player
        end
    end

    def check_game_over
        if board.check_winner
            @game_over = true
            return show_winner(current_player.name, current_player.symbol)
        elsif board.full?
            @game_over = true
            show_no_winner
        end
    end
end
