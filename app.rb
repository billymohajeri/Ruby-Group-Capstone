require './Classes/book'
require './Classes/label'
require './Classes/item'
require './Classes/game'
require './Classes/author'
require './modules/game_module'
require './modules/author_module'
require './modules/common'
require './Classes/music_album'
require './modules/storage'
require 'json'

class App
  include GameModule
  include AuthorModule
  include CommonModule
  include StorageModule
  attr_reader :books, :labels, :games, :authors, :music_albums

  def initialize
    prepare_storage
    @books = []
    @labels = []
    @games = load_games
    @authors = load_authors
    @music_albums = []
    @genres = []


  def list_all_books
    puts "\nNo books added yet" if @books.empty?
    puts "\nAll Books:\n\n"
    puts "\nPublisher \t| Cover State \t| Publish Date"
    puts '--------------------------------------------'
    @books.each do |book|
      puts "#{book.publisher} \t\t| #{book.cover_state} \t\t| #{book.publish_date}"
      puts '--------------------------------------------'
    end
  end

  def list_all_labels
    puts "\nNo labels added yet" if @labels.empty?
    puts "\nAll Labels:\n\n"
    puts "\nLabels \t| Color"
    puts "\n--------------------------------------------"
    @labels.each do |label|
      puts "#{label.title} \t| #{label.color}"
      puts "\n--------------------------------------------"
    end
  end

  def add_book
    puts "\nAdd a new book"
    print 'Publisher:'
    publisher = gets.chomp
    print 'Cover State:'
    cover_state = gets.chomp
    print 'Publish Date[YYYY/MM/DD]:'
    publish_date = gets.chomp
    @books << Book.new(publisher, cover_state, publish_date)
    puts 'Your book has been added successfully!'
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts "\nNo music album added yet"
    else
      puts "\nAll Music Albums:\n\n"
      puts "\non Spotify \t| Publish Date"
      puts '--------------------------------------------'
      @music_albums.each do |music_album|
        puts "#{music_album.on_spotify} \t\t| #{music_album.publish_date}"
        puts '--------------------------------------------'
      end
    end
  end

  def list_all_genres
    if @genres.empty?
      puts "\nNo genres added yet"
    else
      puts "\nAll Genres:\n\n"
      puts "\nGenre"
      puts "\n--------------------------------------------"
      @genres.each do |genre|
        puts genre.name.to_s
        puts "\n--------------------------------------------"
      end
    end
  end

  def add_music_album
    on_spotify_bool = false
    puts "\nAdd a new music_album"
    loop do
      print 'on Spotify[Y/N]: '
      on_spotify_str = gets.chomp.downcase
      if on_spotify_str == 'y'
        on_spotify_bool = true
        break
      elsif on_spotify_str == 'n'
        on_spotify_bool = false
        break
      else
        puts 'Invalid input. Please enter Y or N.'
      end
    end
    print 'Publish Date[YYYY/MM/DD]:'
    publish_date = gets.chomp
    @music_albums << MusicAlbum.new(on_spotify_bool, publish_date)
    puts 'Your music album has been added successfully!'
  end
  
  def prepare_storage
    create_file('games')
    create_file('authors')
  end

  def save_data
    save_to_file(@games.map(&:to_hash), 'games')
    save_to_file(@authors.map(&:to_hash), 'authors')
  end
end
