require './Classes/book'
require './Classes/label'
require './Classes/item'
require './Classes/game'
require './Classes/author'
require './modules/game_module'
require './modules/author_module'
require './modules/common'
require './modules/storage'
require 'json'

class App
  include GameModule
  include AuthorModule
  include CommonModule
  include StorageModule
  attr_reader :books, :labels, :games, :authors

  def initialize
    prepare_storage
    @books = []
    @labels = []
    @games = load_games
    @authors = load_authors
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

  def prepare_storage
    create_file('games')
    create_file('authors')
  end

  def save_data
    save_to_file(@games.map(&:to_hash), 'games')
    save_to_file(@authors.map(&:to_hash), 'authors')
  end
end
