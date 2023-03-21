def process_options(usr_inp)
  options = {
    '1' => -> { puts 'You chose option 1' },
    '2' => -> { puts 'You chose option 2' },
    '3' => -> { puts 'You chose option 3' },
    '4' => -> { puts 'You chose option 4' },
    '5' => -> { puts 'You chose option 5' },
    '6' => -> { puts 'You chose option 6' },
    '7' => -> { puts 'You chose option 7' },
    '8' => -> { puts 'You chose option 8' },
    '9' => -> { puts 'You chose option 9' },
    'A' => -> { puts 'You chose option A' },
    'B' => -> { puts 'You chose option B' },
    'C' => -> { puts 'You chose option C' }
  }

  chosen_option = usr_inp
  if options.key?(chosen_option)
    options[chosen_option].call
  else
    puts "\e[31mInvalid selectin! please try again.\e[0m\n"
  end
end