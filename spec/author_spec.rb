require './Classes/item'
require './Classes/author'

RSpec.describe Author do
  let(:author) { Author.new('Jane', 'Austen') }
  let(:item) { Item.new(Time.new(2020, 1, 1)) }

  it 'adds item to author items' do
    author.add_item(item)
    expect(author.items).to include(item)
  end

  it 'sets author property on item' do
    author.add_item(item)
    expect(item.author).to eq(author)
  end
end
