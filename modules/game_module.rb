module GameModule
  def list_games
    if @games.empty?
      puts "\n\e[31mNo games available!\e[0m\n"
      puts
    else
      puts "\nList of Games\n\n"
      puts '-------------------------------------------------------------------------'
      puts "| Publish Date \t\t| Mode \t\t\t| Last Played At \t|"
      puts '-------------------------------------------------------------------------'
      @games.each do |game|
        puts "| #{game.publish_date} \t\t| #{game.multiplayer ? 'Multiplayer' : 'Singleplayer'} \t\t| #{game.last_played_at} \t\t|"
        puts '-------------------------------------------------------------------------'
      end
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
    print 'Do you want to add new author (1) or select from the list (2)? [Input the number]: '
    type = gets.chomp.to_i
    case type
    when 1
      add_author
      author_id = @authors[-1].id
    when 2
      list_authors
      print "\nEnter author ID: "
      author_id = gets.chomp.to_i
    end
    find_author(author_id)
  end

  def load_games
    games = load_from_file('games').map { |game| Game.new(game['publish_date'], game['multiplayer'], game['last_played_at']) }
    games
  end
end
