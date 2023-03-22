require 'io/console'
require './show_menu'
require './process_options'
require './app'

def main
  app = App.new
  $stdout.clear_screen
  loop do
    show_menu
    user_input = gets.chomp.upcase
    puts
    if user_input == 'D'
      puts "\e[31mThank you for using this app! ♥️ \e[0m"
      exit
    end
    process_options(user_input, app)
  end
end
main
