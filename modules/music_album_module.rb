module MusicAlbumModule
  def list_music_albums
    if @music_albums.empty?
      puts "\n\e[31mNo music albums available!\e[0m\n"
      puts
    else
      puts "\nList of Music Albums\n\n"
      puts '-------------------------------------------------------------------------'
      puts "| on Spotify \t\t| Publish Date \t\t\t|"
      puts '-------------------------------------------------------------------------'
      @music_albums.each do |music_album|
        puts "| #{music_album.on_spotify ? 'On Spotify' : 'Not On Spotify'} \t\t| #{music_album.publish_date} \t\t|"
        puts '-------------------------------------------------------------------------'
      end
    end
  end

  def add_music_album
    puts "\nAdd a music album:"
    on_spotify_bool = false
    print 'on Spotify[Y/N]: '
    on_spotify_str = gets.chomp.downcase
    on_spotify_bool = true if on_spotify_str == 'y'
    print 'Publish date [YYYY-MM-DD]: '
    publish_date = validate_date(gets.chomp)
    music_album = MusicAlbum.new(on_spotify_bool, publish_date)
    genre = music_album_genre
    genre.add_item(music_album)
    @music_albums << music_album
    puts "\e[32mMusic album added successfully!\e[0m"
  end

  def music_album_genre
    print 'Do you want to add new genre (1) or select from the list (2)? [Input the number]: '
    type = gets.chomp.to_i
    case type
    when 1
      add_genre
      genre_id = @genres[-1].id
    when 2
      list_genres
      print "\nEnter genre ID: "
      genre_id = gets.chomp.to_i
    end
    find_genre(genre_id)
  end

  def load_music_albums
    load_from_file('music_albums').map { |music_album| MusicAlbum.new(music_album['on_spotify'], music_album['publish_date']) }
  end
end
