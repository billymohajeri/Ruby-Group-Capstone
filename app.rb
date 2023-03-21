require './Classes/book'
require './Classes/label'

class App
  attr_reader :books, :labels

  def initialize
    @books = []
    @labels = []
  end

  def list_all_books
    puts '\nNo books added yet' if @books.empty?
    puts '\nAll Books:\n\n'
    puts "\nPublisher \t| Cover State \t| Publish Date"
    puts '\n--------------------------------------------'
    @books.each do |book|
      puts "#{book.publisher} \t| #{book.cover_state} \t| #{book.publish_date}"
      puts '\n--------------------------------------------'
    end
  end

  def list_all_labels
    puts '\nNo labels added yet' if @labels.empty?
    puts '\nAll Labels:\n\n'
    puts "\nLabels \t| Color"
    puts '\n--------------------------------------------'
    @labels.each do |label|
      puts "#{label.title} \t| #{label.color}"
      puts '\n--------------------------------------------'
    end
  end

  def add_book
    puts '\nAdd a new book'
    puts '\nPublisher:'
    publisher = gets.chomp
    puts '\nCover State:'
    cover_state = gets.chomp
    puts '\nPublish Date[YYYY/MM/DD]:'
    publish_date = gets.chomp
    @books << Book.new(publisher, cover_state, publish_date)
  end
end
