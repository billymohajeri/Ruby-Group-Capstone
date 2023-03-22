require './Classes/item'
require './Classes/game'
require './Classes/author'

class App
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def list_games
    if @games.empty?
      puts "\n\e[31mNo games available!\e[0m\n"
      puts
    else
      puts "\nList of Games\n\n"
      puts '-------------------------------------------------------------------------'
      puts "| Publish Date \t\t| Game Mode \t\t| Last Played At \t|"
      puts '-------------------------------------------------------------------------'
      @games.each do |game|
        puts "| #{game.publish_date} \t\t| #{game.multiplayer ? 'Multiplayer' : 'Singleplayer'} \t\t| #{game.last_played_at} \t\t|"
        puts '-------------------------------------------------------------------------'
      end
    end
  end

  def list_authors
    if @authors.empty?
      puts "\n\e[31mNo authors available!\e[0m\n"
      puts
    else
      puts "\nList of Authors \n\n"
      puts '-----------------------------------------------------------------'
      puts "| ID \t\t| First Name \t\t| Last Name \t\t|"
      puts '-----------------------------------------------------------------'
      @authors.each_with_index do |author, _index|
        puts "| #{author.id} \t\t| #{author.first_name} \t\t\t| #{author.last_name} \t\t\t|"
        puts '------------------------------------------------------------------'
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
    game = Game.new(multiplayer, last_played_at, publish_date)
    author = game_author
    author.add_item(game)
    @games << game
    puts "\e[32mGame added successfully!\e[0m"
  end

  def game_author
    if @authors.empty?
      add_author
      author_index = @authors[0].id
    else
      list_authors
      print "\n Enter author ID: "
      author_index = gets.chomp.to_i
    end
    find_author(author_index)
  end

  def add_author
    puts "\nAdd author details:"
    print 'First name: '
    first_name = empty?(gets.chomp.to_s)
    print 'Last name: '
    last_name = empty?(gets.chomp.to_s)
    author = Author.new(first_name, last_name)
    @authors << author
    puts "\e[32mAuthor added successfully!\e[0m"
  end

  def find_author(id)
    authors = @authors.select { |author| author.id == id }
    authors.first
  end

  def validate?(date)
    Date.iso8601(date.to_s)
    true
  rescue ArgumentError
    false
  end

  def validate_date(date)
    if validate?(date)
      date
    else
      print "\e[31mEnter valid date format [yyyy-mm-dd]: \e[0m"
      answer = gets.chomp
      validate_date(answer)
    end
  end

  def empty?(text)
    if text.empty? || text == ''
      print "\e[31mEnter valid data: \e[0m"
      answer = gets.chomp
      empty?(answer)
    else
      text
    end
  end
end
