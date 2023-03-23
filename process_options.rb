def process_options(usr_inp, app)
  options = {
    '1' => -> { app.list_all_books },
    '2' => -> { app.show_list_music_albums },
    '3' => -> { app.show_list_games },
    '4' => -> { app.show_list_genres },
    '5' => -> { app.list_all_labels },
    '6' => -> { app.show_list_authors },
    '7' => -> { app.add_book },
    '8' => -> { app.add_music_album },
    '9' => -> { app.add_game }
  }

  chosen_option = usr_inp
  if options.key?(chosen_option)
    options[chosen_option].call
  else
    puts "\e[31mInvalid selection! Please try again.\e[0m\n"
  end
end
