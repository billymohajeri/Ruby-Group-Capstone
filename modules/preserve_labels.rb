require 'json'

module PreserveLabels
  def save_labels
    label_store = @labels.map do |label|
      {
        title: label.title,
        color: label.color
      }
    end
    File.new('./json/labels.json', 'w') unless File.exist?('./json/labels.json')
    File.open('./json/labels.json', 'w') do |file|
      file.puts(JSON.pretty_generate(label_store))
    end
  end

  def read_labels
    if File.exist?('./json/labels.json')
      File.open('./json/labels.json', 'r') do |file|
        label_store = JSON.parse(file.read)
        label_store.each do |label|
          @labels << Label.new(label['title'], label['color'])
        end
      end
    else
      []
    end
  end
end
