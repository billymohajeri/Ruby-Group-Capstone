module MusicAlbumModule
  def show_list_music_albums
    if @music_albums.empty?
      puts "\n\e[31mNo music albums available!\e[0m\n"
      puts
    else
      puts "\nList of Music Albums\n\n"
      list_music_albums
    end
  end

  def list_music_albums
    puts '-------------------------------------------------------------------------'
    puts "| Index \t| On Spotify \t\t| Publish Date \t\t\t|"
    puts '-------------------------------------------------------------------------'
    @music_albums.each_with_index do |music_album, index|
      puts "| #{index} \t\t| #{music_album.on_spotify ? 'On Spotify' : 'Not On Spotify'} \t\t| #{music_album.publish_date} \t\t|"
      puts '-------------------------------------------------------------------------'
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
    print "\nDo you want to add genre (1) or show list (2)? [Input the number]: "
    type = gets.chomp.to_i
    case type
    when 1
      add_genre
      genre_id = @genres.length - 1
    when 2
      if @genres.empty?
        puts "\n\e[31mNo genre available, please add genre!\e[0m\n"
        add_genre
        genre_id = @genres.length - 1
      else
        puts "\nSelect an author from the following list by index (not id) \n"
        list_genres
        genre_id = idx_validate(@genres, gets.chomp.to_i)
      end
    end
    @genres[genre_id]
  end

  def load_music_albums
    load_from_file('music_albums').map { |music_album| MusicAlbum.new(music_album['on_spotify'], music_album['publish_date']) }
  end
end
