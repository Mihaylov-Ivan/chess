require_relative 'display.rb'
require_relative 'player.rb'
require_relative 'board.rb'

class Gameplay
    include Display

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




        start_square = move.split[0]
        end_sqaure = move.split[1]

        col = check_move_input(col).to_i-1
        rows = board.length-1
        rows.downto(0) do |row|
            return [row, col] if board.check_available([row, col])
        end

        show_move_error
        validate_move(gets.chomp)
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

            board.update(move, current_player.symbol)
            board.show
            check_game_over
            switch_current_player
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
