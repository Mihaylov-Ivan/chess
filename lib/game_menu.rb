require_relative "./display.rb"
require_relative "./gameplay.rb"

class GameMenu
    include Display

    attr_reader :exit_game

    def initialize
        show_game_start
        game_options_prompt
        @exit_game = false
    end

    def play
        until exit_game
            game_option = get_game_option(gets.chomp)
            case game_option
            when "1"
                play_new_game
            when "2"
                play_saved_game
            else
                exit_game = true
            end
        end
    end

    # ==============PRIATE==============
    private

    def get_game_option(option)
        until option == "1" || option == "2" || option == "3"
            raise_game_option_error
            show_game_options
            option = gets.chomp
        end
        option
    end

    def play_new_game
        new_game = PlayGame.new(lives, word, word_guess, [])
        new_game.play_game
    end
    def play_saved_game
        if Dir.exist?('../saved_games') && Dir["../saved_games/*.yaml"].length > 0 then
            saved_games = Dir["../saved_games/*.yaml"]
            saved_games.map!{ |path| File.basename(path, ".yaml")}
            display_saved_games(saved_games)
        else
            display_no_saved_games
            return
        end
        game_to_load = get_saved_game(saved_games)
        return if game_to_load == "*exit*"
        data = YAML.load(File.read("../saved_games/#{game_to_load}.yaml"))
        loaded_game = PlayGame.new(data[0], data[1], data[2].join(" "), data[3])
        loaded_game.play_game
    end

    def get_saved_game(saved_games)
        game = gets.chomp.to_s
        until saved_games.include?(game) || game == "*exit*"
            raise_saved_game_does_not_exist(game)
            display_saved_games(saved_games)
            game = gets.chomp.to_s
        end
        game
    end
end
