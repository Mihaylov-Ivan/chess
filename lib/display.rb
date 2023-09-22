module Display

  # Prompts ---------------------------------------------------------
  def player_turn_prompt(colour)
    puts "#{colour}, make a move!"
  end

  def game_options_prompt
    puts <<~HEREDOC

    Select one of the options:
    1. NEW GAME
    2. LOAD GAME
    3. Exit

    HEREDOC
  end

  # Messages --------------------------------------------------------
  def show_winner(colour)
    puts "Congratulations #{colour}! You are the winner!"
  end

  def show_draw
      puts "It's a draw!."
  end

  def instructions
    puts <<~HEREDOC

    The pieces are Pawn ♙, Bishop ♗, Knight ♘, Rook ♖, Queen ♕ and King ♔.
    To make a move, please specify the square the piece you want to move is in, and the square you want to move it to.

    For example, to move a Bishop on 1C to 3E, you would enter:
    '1C 3E'

    Enjoy!

    HEREDOC
  end

  def show_game_start
    puts "Welcome to Chess!".bold
    puts "You can save or exit the game at any point by entering specific phrases in the terminal."
    puts "To save and exit your game, enter '*save*'."
    puts "To exit the game without saving, enter '*exit*'."
  end

  # Errors ----------------------------------------------------------
  def raise_game_option_error
    puts "Please choose 1, 2 or 3.".red
  end

  def raise_input_error
    puts "Sorry, that is an invalid input. Please, try again.".red
  end

  def raise_move_error
    puts "This is an invalid move. Try again.".red
  end
end
