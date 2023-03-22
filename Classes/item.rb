class Item
  # new line
  attr_reader :id, :genre, :author, :source, :label, :archived, :publish_date

  def initialize(publish_date)
    @id = rand(1..1000)
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  # def genre(new_genre)
  def genre=(new_genre)
    @genre = new_genre
    new_genre.items.push(self) unless new_genre.items.include?(self)
  end

  # def author(new_author)
  def author=(new_author)
    @author = new_author
    new_author.items.push(self) unless new_author.items.include?(self)
  end

  # def source
  def source=(new_source)
    @source = new_source
    new_source.items.push(self) unless new_source.items.include?(self)
  end

  # def label
  def label=(new_label)
    @label = new_label
    new_label.items.push(self) unless new_label.items.include?(self)
  end

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end
end
