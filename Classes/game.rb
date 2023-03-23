require 'active_support/all'
require './Classes/item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && last_played_at < 2.years.ago
  end

  def to_hash
    {
      type: self.class.name,
      publish_date: @publish_date,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at
    }
  end
end
