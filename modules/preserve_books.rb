require 'json'

module PreserveBooks
  def save_books
    book_store = @books.map do |book|
      {
        publisher: book.publisher,
        cover_state: book.cover_state,
        publish_date: book.publish_date
      }
    end
    File.new('./json/books.json', 'w') unless File.exist?('./json/books.json')
    File.open('./json/books.json', 'w') do |file|
      file.puts(JSON.pretty_generate(book_store))
    end
  end

  def read_books
    if File.exist?('./json/books.json')
      File.open('./json/books.json', 'r') do |file|
        book_store = JSON.parse(file.read)
        book_store.each do |book|
          @books << Book.new(book['publisher'], book['cover_state'], book['publish_date'])
        end
      end
    else
      []
    end
  end
end
