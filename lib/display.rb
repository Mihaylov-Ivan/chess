module Display
  def player_name_prompt(number, colour)
    puts "#{colour} player, what is your name?"
  end

  def show_input_error
    puts "\e[31mSorry, that is an invalid input. Please, try again.\e[0m"
  end

  def player_turn_prompt(colour)
    puts "#{colour}, make a move!"
  end

  def show_move_error
    puts "\e[31mThis is an invalid move. Try again.\e[0m"
  end

  def show_winner(colour)
    puts "Congratulations #{colour}! You are the winner!"
  end

  def show_draw
      puts "It's a draw!."
  end
end
