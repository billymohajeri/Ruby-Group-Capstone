require './Classes/book'
require './Classes/label'

class App
  attr_reader :books, :labels

  def initialize
    @books = []
    @labels = []
  end

  def list_all_books
    puts "\nNo books added yet" if @books.empty?
    puts "\nAll Books:\n\n"
    puts "\nPublisher \t| Cover State \t| Publish Date"
    puts "--------------------------------------------"
    @books.each do |book|
      puts "#{book.publisher} \t\t| #{book.cover_state} \t\t| #{book.publish_date}"
      puts "--------------------------------------------"
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
end
