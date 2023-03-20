def process_options(usr_inp)
  case usr_inp
  when '1'
    puts 1
  when '2'
    puts 2
  when '3'
    puts 3
  when '4'
    puts 4
  when '5'
    puts 5
  when '6'
    puts 6
  when '7'
    puts 7
  when '8'
    puts 8
  when '9'
    puts 9
  when 'A'
    puts 'A'
  when 'B'
    puts 'B'
  when 'C'
    puts 'C'
  else
    puts "\e[31mInvalid selectin! please try again."
  end
end
