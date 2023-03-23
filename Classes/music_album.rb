require 'active_support/all'
require './Classes/item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_hash
    {
      type: self.class.name,
      publish_date: @publish_date,
      on_spotify: @on_spotify
    }
  end
end
