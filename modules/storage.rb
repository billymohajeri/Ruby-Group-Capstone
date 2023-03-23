require 'json'

module StorageModule
  def create_file(file_name)
    FileUtils.mkdir_p('./json')
    @path = "./json/#{file_name}.json"
    File.write(@path, '[]') unless File.file?(@path)
  end

  def save_to_file(data, file_name)
    json = JSON.pretty_generate(data)
    File.write("./json/#{file_name}.json", json)
  end

  def load_from_file(file_name)
    data = File.read("./json/#{file_name}.json")
    JSON.parse(data)
  end
end
