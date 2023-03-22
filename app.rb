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
    @labels = []
    @games = load_games
    @authors = load_authors
    @music_albums = load_music_albums
    @genres = load_genres
    read_books
    read_labels
  end

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
    book = Book.new(publisher, cover_state, publish_date)
    book_label
    # label.add_item(book)
    @books << book
    puts 'Your book has been added successfully!'
    save_books
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
    print 'Do you want to add new label (1) or select from the list (2)? [Input the number]: '
    type = gets.chomp.to_i
    case type
    when 1
      add_label
      label_id = @labels[-1].id
    when 2
      list_all_labels
      print "\nEnter Label id: "
      label_id = gets.chomp.to_i
    end
    find_label(label_id)
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
  end

  def save_data
    save_to_file(@games.map(&:to_hash), 'games')
    save_to_file(@authors.map(&:to_hash), 'authors')
  end
end
>>>>>>>>> Temporary merge branch 2
