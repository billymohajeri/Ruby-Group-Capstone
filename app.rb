require './Classes/book'
require './Classes/label'
require './Classes/item'
require './Classes/game'
require './Classes/author'
require './modules/game_module'
require './modules/author_module'
require './modules/common'
require './modules/preserve_books'
require './modules/preserve_labels'

class App
  include GameModule
  include AuthorModule
  include CommonModule
  include PreserveBooks
  include PreserveLabels

  attr_reader :books, :labels, :games, :authors

  def initialize
    @books = []
    @labels = []
    @games = []
    @authors = []
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
    if @labels.empty?
      add_label
      label_index = @labels[0].id
    else
      list_all_labels
      print "\nEnter author ID: "
      label_index = gets.chomp.to_i
    end
    find_label(label_index)
  end

  def find_label(id)
    labels = @labels.select { |label| label.id == id }
    labels.first
  end
end
