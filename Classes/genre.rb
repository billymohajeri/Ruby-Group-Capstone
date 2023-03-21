class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(_name, _items)
    @id = rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
