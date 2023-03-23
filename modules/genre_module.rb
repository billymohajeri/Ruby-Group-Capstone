module GenreModule
  def list_genres
    if @genres.empty?
      puts "\n\e[31mNo genres available!\e[0m\n"
      puts
    else
      puts "\nList of Genres \n\n"
      puts '---------------------------------------------------------'
      puts "| ID \t\t| Name \t\t\t\t\t|"
      puts '---------------------------------------------------------'
      @genres.each_with_index do |genre, _index|
        puts "| #{genre.id} \t\t| #{genre.name} \t\t\t\t|"
        puts '---------------------------------------------------------'
      end
    end
  end

  def add_genre
    puts "\nAdd genre details:"
    print 'Name: '
    name = empty?(gets.chomp.to_s)
    genre = Genre.new(name)
    @genres << genre
    puts "\e[32mGenre added successfully!\e[0m"
  end

  def find_genre(id)
    genres = @genres.select { |genre| genre.id == id }
    genres.first
  end

  def load_genres
    genres = []
    data = load_from_file('genres')

    data.map do |items|
      genre = Genre.new(items['name'])
      items['items'].map do |item|
        if item['type'].include?('MusicAlbum')
          music_album = MusicAlbum.new(item['on_spotify'], item['publish_date'])
          genre.add_item(music_album)
        end
      end
      genres << genre
    end
    genres
  end
end
