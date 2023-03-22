require './Classes/item'
require './Classes/game'
require './Classes/author'
require './modules/game_module'
require './modules/author_module'
require './modules/common'

class App
  include GameModule
  include AuthorModule
  include CommonModule

  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
  end
end
