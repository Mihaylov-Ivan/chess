require_relative './lib/game.rb'
require_relative './lib/board.rb'

def play
    # chess = Game.new
    # chess.play
    board = Board.new
    board.show
end

play
