require './Classes/music_album'
require 'date'

describe MusicAlbum do
  context 'MusicAlbum class test' do
    before(:each) do
      @music_album1 = MusicAlbum.new(false, Date.parse('2020/1/5'))
      @music_album2 = MusicAlbum.new(true, Date.parse('2000/11/7'))
    end

    it 'should create an instance of MusicAlbum class' do
      expect(@music_album1).to be_an_instance_of(MusicAlbum)
      expect(@music_album2).to be_an_instance_of(MusicAlbum)
    end

    it 'should be on spotify' do
      expect(@music_album1.on_spotify).to eq(false)
      expect(@music_album2.on_spotify).to eq(true)
    end

    it 'should return false unless @archived && on_spotify == true' do
      expect(@music_album1.can_be_archived?).to eq false
      expect(@music_album2.can_be_archived?).to eq true
    end
  end
end
