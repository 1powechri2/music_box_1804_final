require 'rails_helper'

describe Award, type: :model do
  describe 'relationships' do
    it{should have_many(:award_years)}
    it{should have_many(:songs).through(:award_years)}
  end
  describe 'instance methods' do
    it 'finds award by award year' do
      artist = Artist.create(name:'Adele')
      song_1 = artist.songs.create(title: "Don't Stop Believin", length: 303, play_count: 123456)

      award_1 = Award.create(name: "Awsome")
      award_2 = Award.create(name: "Cool")

      song_award_1 = AwardYear.create(year: 1990, award_id: award_1.id, song_id: song_1.id)
      song_award_2 = AwardYear.create(year: 1991, award_id: award_2.id, song_id: song_1.id)

      expect(award_1.find_award_year).to eq(song_award_1.year)
    end
  end
end
