module AuthorModule
  def show_list_authors
    if @authors.empty?
      puts "\n\e[31mNo authors available!\e[0m\n"
    else
      puts "\nList of Authors \n\n"
      list_authors
    end
  end

  def list_authors
    puts '-----------------------------------------------------------------------------------'
    puts "| Index \t| ID \t\t| Name \t\t\t\t\t\t|"
    puts '-----------------------------------------------------------------------------------'
    @authors.each_with_index do |author, index|
      puts "| #{index} \t\t| #{author.id} \t\t| #{author.first_name} #{author.last_name} \t\t\t\t|"
      puts '-----------------------------------------------------------------------------------'
    end
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

  def load_authors
    authors = []
    data = load_from_file('authors')

    data.map do |items|
      author = Author.new(items['first_name'], items['last_name'])
      items['items'].map do |item|
        if item['type'].include?('Game')
          game = Game.new(item['publish_date'], item['multiplayer'], item['last_played_at'])
          author.add_item(game)
        end
      end
      authors << author
    end
    authors
  end
end
