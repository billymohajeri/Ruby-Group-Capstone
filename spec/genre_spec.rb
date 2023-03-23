require './Classes/genre'
require './Classes/item'
require 'date'

describe Genre do
  context 'Genre class tests' do
    before(:each) do
      @genre = Genre.new('g')
    end

    it 'should create an instance of Genre class' do
      expect(@genre).to be_an_instance_of(Genre)
    end

    it 'should have a name' do
      expect(@genre.name).to eq('g')
    end

    it 'should have an id' do
      expect(@genre.id).to be_an_instance_of(Integer)
    end

    it 'should have an array of items' do
      expect(@genre.items).to be_an_instance_of(Array)
    end

    it 'should add an item to the array of items' do
      item = Item.new(Date.parse('2017/03/27'))
      @genre.add_item(item)
      expect(@genre.items).to include(item)
    end
  end
end
