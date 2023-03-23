module GameModule
  def show_list_games
    if @games.empty?
      puts "\n\e[31mNo games available!\e[0m\n"
      puts
    else
      puts "\nList of Games\n\n"
      list_games
    end
  end

  def list_games
    puts '-----------------------------------------------------------------------------------------'
    puts "| Index \t| Publish Date \t\t| Mode \t\t\t| Last Played At \t|"
    puts '-----------------------------------------------------------------------------------------'
    @games.each_with_index do |game, index|
      puts "| #{index} \t\t| #{game.publish_date} \t\t| #{game.multiplayer ? 'Multiplayer' : 'Singleplayer'} \t\t| #{game.last_played_at} \t\t|"
      puts '-----------------------------------------------------------------------------------------'
    end
  end

  def add_game()
    puts "\nAdd a game:"
    print 'Publish date [YYYY-MM-DD]: '
    publish_date = validate_date(gets.chomp)
    print 'Multiplayer [Y/N]: '
    multiplayer = gets.chomp.downcase == 'y'
    print 'Last played at [YYYY-MM-DD]: '
    last_played_at = validate_date(gets.chomp)
    game = Game.new(publish_date, multiplayer, last_played_at)
    author = game_author
    author.add_item(game)
    @games << game
    puts "\e[32mGame added successfully!\e[0m"
  end

  def game_author
    print "\nDo you want to add author (1) or show list (2)? [Input the number]: "
    type = gets.chomp.to_i
    case type
    when 1
      add_author
      author_id = @authors.length - 1
    when 2
      if @authors.empty?
        puts "\n\e[31mNo authors available, please add an author!\e[0m\n"
        add_author
        author_id = @authors.length - 1
      else
        puts "\nSelect an author from the following list by index (not id) \n"
        list_authors
        author_id = idx_validate(@authors, gets.chomp.to_i)
      end
    end
    @authors[author_id]
  end

  def load_games
    load_from_file('games').map { |game| Game.new(game['publish_date'], game['multiplayer'], game['last_played_at']) }
  end
end
