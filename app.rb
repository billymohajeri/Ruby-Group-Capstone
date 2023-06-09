require './Classes/book'
require './Classes/label'
require './Classes/item'
require './Classes/game'
require './Classes/author'
require './Classes/music_album'
require './Classes/genre'
require './modules/game_module'
require './modules/author_module'
require './modules/common'
require './modules/preserve_books'
require './modules/preserve_labels'
require './modules/storage'
require './modules/music_album_module'
require './modules/genre_module'
require 'json'

class App
  include GameModule
  include AuthorModule
  include CommonModule
  include StorageModule
  include MusicAlbumModule
  include GenreModule
  include PreserveBooks
  include PreserveLabels

  attr_reader :books, :labels, :games, :authors, :music_albums, :genres

  def initialize
    prepare_storage
    @books = []
    @games = load_games
    @authors = load_authors
    @music_albums = load_music_albums
    @genres = load_genres
    read_books
    @labels = read_labels
  end

  def list_all_books
    puts "\nNo books added yet" if @books.empty?
    puts "\nAll Books:\n\n"
    puts "\n| Index \t| Publisher \t| Cover State \t| Publish Date"
    puts '--------------------------------------------'
    @books.each_with_index do |book, index|
      puts " |#{index} \t\t|#{book.publisher} \t\t| #{book.cover_state} \t\t| #{book.publish_date}"
      puts '--------------------------------------------'
    end
  end

  def list_all_labels
    puts "\nNo labels added yet" if @labels.empty?
    puts "\nAll Labels:\n\n"
    puts "\n| Index \t| Labels \t| Color"
    puts "\n--------------------------------------------"
    @labels.each_with_index do |label, index|
      puts "| #{index} \t\t| #{label.title} \t| #{label.color}"
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
    book = Book.new(publisher, cover_state, publish_date)
    label = book_label
    label.add_item(book)
    @books << book
    puts 'Your book has been added successfully!'
    save_books
    save_labels
  end

  def add_label
    puts "\nAdd author details:"
    print 'Title: '
    title = empty?(gets.chomp.to_s)
    print 'Color: '
    color = empty?(gets.chomp.to_s)
    label = Label.new(title, color)
    @labels << label
    puts "\e[32mLabel added successfully!\e[0m"
    save_labels
  end

  def book_label
    print "\nDo you want to add label (1) or show list (2)? [Input the number]: "
    type = gets.chomp.to_i
    case type
    when 1
      add_label
      label_id = @labels.length - 1
    when 2
      if @labels.empty?
        puts "\n\e[31mNo labels available, please add a label!\e[0m\n"
        add_label
        label_id = @labels.length - 1
      else
        puts "\nSelect an author from the following list by index (not id) \n"
        list_all_labels
        label_id = idx_validate(@labels, gets.chomp.to_i)
      end
    end
    @labels[label_id]
  end

  def find_label(id)
    labels = @labels.select { |label| label.id == id }
    labels.first
  end

  def prepare_storage
    create_file('games')
    create_file('authors')
    create_file('music_albums')
    create_file('genres')
    create_file('labels')
    create_file('books')
  end

  def save_data
    save_to_file(@games.map(&:to_hash), 'games')
    save_to_file(@authors.map(&:to_hash), 'authors')
    save_to_file(@music_albums.map(&:to_hash), 'music_albums')
    save_to_file(@genres.map(&:to_hash), 'genres')
  end
end
