def process_options(usr_inp, app)
  options = {
    '1' => -> { app.list_all_books },
    '2' => -> { app.list_music_albums },
    '3' => -> { puts 'You chose option 3' },
    '4' => -> { app.list_games },
    '5' => -> { app.list_genres },
    '6' => -> { app.list_all_labels },
    '7' => -> { app.list_authors },
    '8' => -> { puts 'You chose option 8' },
    '9' => -> { app.add_book },
    'A' => -> { app.add_music_album },
    'B' => -> { puts 'You chose option B' },
    'C' => -> { app.add_game }
  }

  chosen_option = usr_inp
  if options.key?(chosen_option)
    options[chosen_option].call
  else
    puts "\e[31mInvalid selection! please try again.\e[0m\n"
  end
end
