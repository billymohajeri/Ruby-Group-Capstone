class Item
  def initialize(publish_date)
    @id = rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @lable = lable
    @publish_date = publish_date
    @archived = false
  end

  def genre(new_genre)
    @genre = new_genre
    new_genre.items.push(self) unless new_genre.items.include?(self)
  end

  def author(new_author)
    @author = new_author
    new_author.items.push(self) unless new_author.items.include?(self)
  end

  def source
    @source = new_source
    new_source.items.push(self) unless new_source.items.include?(self)
  end

  def lable
    @lable = new_lable
    new_lable.items.push(self) unless new_lable.items.include?(self)
  end

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end

  def move_to_archive()
    @archived = can_be_archived? if can_be_archived?
  end
end
