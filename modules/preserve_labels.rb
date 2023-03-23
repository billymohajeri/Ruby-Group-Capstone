require 'json'

module PreserveLabels
  def save_labels
    label_store = @labels.map do |label|
      {
        title: label.title,
        color: label.color,
        items: label.items.map(&:to_hash)
      }
    end
    File.new('./json/labels.json', 'w') unless File.exist?('./json/labels.json')
    File.open('./json/labels.json', 'w') do |file|
      file.puts(JSON.pretty_generate(label_store))
    end
  end

  def read_labels
    labels = []
    data = load_from_file('labels')

    data.map do |items|
      label = Label.new(items['title'], items['color'])
      items['items'].map do |item|
        if item['type'].include?('Book')
          book = Book.new(item['publisher'], item['cover_state'], item['publish_date'])
          label.add_item(book)
        end
      end
      labels << label
    end
    labels
  end
end
