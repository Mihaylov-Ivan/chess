require_relative './pieces/*'

class Board

    attr_reader :board, :black_square, :white_square

    def initialize
        # create_pieces

        black_square_positions = ['1A', '1C', '1E', '1G', '2B', '2D', '2F', '2H',
            '3A', '3C', '3E', '3G', '4B', '4D', '4F', '4H',
            '5A', '5C', '5E', '5G', '5B', '5D', '5F', '5H',
            '7A', '7C', '7E', '7G', '8B', '8D', '8F', '8H']
        black_square_positions = ['1B', '1D', '1F', '1H', '2A', '2C', '2E', '2G',
            '3B', '3D', '3F', '3H', '4A', '4C', '4E', '4G',
            '5B', '5D', '5F', '5H', '6A', '6C', '6E', '6G',
            '7B', '7D', '7F', '7H', '8A', '8C', '8E', '8G',]

        @board = [[white_rooks[0], white_knights[0], white_bishops[0], white_queen, white_king, white_bishops[1], white_knights[1], white_rooks[1]],
        [white_pawns[0], white_pawns[1], white_pawns[2], white_pawns[3], white_pawns[4], white_pawns[5], white_pawns[6], white_pawns[7]],
        [black_square, white_square, black_square, white_square, black_square, white_square, black_square, white_square],
        [white_square, black_square, white_square, black_square, white_square, black_square, white_square, black_square],
        [black_square, white_square, black_square, white_square, black_square, white_square, black_square, white_square],
        [white_square, black_square, white_square, black_square, white_square, black_square, white_square, black_square],
        [black_pawns[0], black_pawns[1], black_pawns[2], black_pawns[3], black_pawns[4], black_pawns[5], black_pawns[6], black_pawns[7]],
        [black_rooks[0], black_knights[0], black_bishops[0], black_queen, black_king, black_bishops[1], black_knights[1], black_rooks[1]]]
    end

    # def create_pieces
    #     @black_square = '◼'
    #     @white_square = '◻'

    #     @white_pawns = []
    #     @black_pawns = []
    #     ('A'..'H').each do |letter|
    #         white_pawns << Pawn.new('White', number, "2#{letter}")
    #         black_pawns << Pawn.new('Black', number, "7#{letter}")
    #         number++
    #     end

    #     @white_rooks = [Rook.new('White', 0, '1A'), Rook.new('White', 1, '1H')]
    #     @white_knights = [Knight.new('White', 0, '1B'), Rook.new('White', 1, '1G')]
    #     @white_bishops = [Bishop.new('White', 0, '1C'), Rook.new('White', 1, '1F')]
    #     @white_king = King.new('White', '1E')
    #     @white_queen = Queen.new('White', '1D')

    #     @black_rooks = [Rook.new('Black', 0, '8A'), Rook.new('Black', 1, '8H')]
    #     @black_knights = [Knight.new('Black', 0, '8B'), Rook.new('Black', 1, '8G')]
    #     @black_bishops = [Bishop.new('Black', 0, '8C'), Rook.new('Black', 1, '8F')]
    #     @black_king = King.new('Black', '8E')
    #     @black_queen = Queen.new('Black', '1D')
    # end

    def show
        puts <<-HEREDOC

        8  |#{board[7][0].symbol} |#{board[7][1].symbol} |#{board[7][2].symbol} |#{board[7][3].symbol} |#{board[7][4].symbol} |#{board[7][5].symbol} |#{board[7][6].symbol} |#{board[7][7].symbol} |
        7  |#{board[6][0].symbol} |#{board[6][1].symbol} |#{board[6][2].symbol} |#{board[6][3].symbol} |#{board[6][4].symbol} |#{board[6][5].symbol} |#{board[6][6].symbol} |#{board[6][7].symbol} |
        6  |#{board[5][0].symbol} |#{board[5][1].symbol} |#{board[5][2].symbol} |#{board[5][3].symbol} |#{board[5][4].symbol} |#{board[5][5].symbol} |#{board[5][6].symbol} |#{board[5][7].symbol} |
        5  |#{board[4][0].symbol} |#{board[4][1].symbol} |#{board[4][2].symbol} |#{board[4][3].symbol} |#{board[4][4].symbol} |#{board[4][5].symbol} |#{board[4][6].symbol} |#{board[4][7].symbol} |
        4  |#{board[3][0].symbol} |#{board[3][1].symbol} |#{board[3][2].symbol} |#{board[3][3].symbol} |#{board[3][4].symbol} |#{board[3][5].symbol} |#{board[3][6].symbol} |#{board[3][7].symbol} |
        3  |#{board[2][0].symbol} |#{board[2][1].symbol} |#{board[2][2].symbol} |#{board[2][3].symbol} |#{board[2][4].symbol} |#{board[2][5].symbol} |#{board[2][6].symbol} |#{board[2][7].symbol} |
        2  |#{board[1][0].symbol} |#{board[1][1].symbol} |#{board[1][2].symbol} |#{board[1][3].symbol} |#{board[1][4].symbol} |#{board[1][5].symbol} |#{board[1][6].symbol} |#{board[1][7].symbol} |
        1  |#{board[0][0].symbol} |#{board[0][1].symbol} |#{board[0][2].symbol} |#{board[0][3].symbol} |#{board[0][4].symbol} |#{board[0][5].symbol} |#{board[0][6].symbol} |#{board[0][7].symbol} |

            A  B  C  D  E  F  G  H
        HEREDOC
    end

    def available_position?(piece, end_position)
        available_movement = []

        [piece.available_movement_left, piece.available_movement_right, piece.available_movement_up, piece.available_movement_down].each do |movements|
            movements.each do |position|
                available_movement << position
                item = board[position[0], position[1]]
                unless item == black_square || item == white_square
                    return
                end
            end
        end

        available_movement.include?(end_position)
    end
end
