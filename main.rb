require 'io/console'
#require './show_menu'
#require './process_options'
require_relative './show_menu'
require_relative './process_options'


def main
  #$stdout.clear_screen
  system("cls") || system("clear")
  # this line added newly
  puts "\e[32mWelcome to Catalog of my things App!\e[0m"
  puts
  loop do
    show_menu
    user_input = gets.chomp.upcase
    puts
    if user_input == 'D'
      #puts "\e[31mThank you for using this app! ♥️"
      puts "\e[31mThank you for using this app! ♥️ \e[0m"
      exit
    end
    process_options(user_input)
  end
end
main
