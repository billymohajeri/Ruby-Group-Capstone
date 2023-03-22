def process_options(usr_inp, app)
  options = {
    '1' => -> { app.list_all_books },
    '2' => -> { puts 'You chose option 2' },
    '3' => -> { puts 'You chose option 3' },
    '4' => -> { app.list_games },
    '5' => -> { puts 'You chose option 5' },
    '6' => -> { app.list_all_labels },
    '7' => -> { app.list_authors },
    '8' => -> { puts 'You chose option 8' },
    '9' => -> { app.add_book },
    'A' => -> { puts 'You chose option A' },
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
