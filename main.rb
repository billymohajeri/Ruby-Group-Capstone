require 'io/console'
require './show_menu'
require './process_options'
require './app'

def main
  $stdout.clear_screen
  app = App.new
  loop do
    show_menu
    user_input = gets.chomp.upcase
    puts
    if user_input == 'D'
      puts "\e[31mThank you for using this app! ♥️ \e[0m"
      exit
    end
    process_options(app, user_input)
  end
end
main
