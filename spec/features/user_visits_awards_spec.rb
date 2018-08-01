require 'rails_helper'

describe 'award index' do
  it 'user can see all awards, each award a link to show page' do
    award_1 = Award.create(name: 'Oh Yeah')
    award_2 = Award.create(name: 'Amazing')

    visit awards_path

    expect(page).to have_content(award_1.name)
    expect(page).to have_content(award_2.name)

    click_on award_2.name

    expect(current_path).to eq(award_path(award_2))
    expect(page).to have_content(award_2.name)
  end
  it 'can visit a show page and see all songs for that award and each year the award was recieved' do
    artist = Artist.create(name:'Adele')
    song_1 = artist.songs.create(title: "Don't Stop Believin", length: 303, play_count: 123456)
    song_2 = artist.songs.create(title: "Never Gonna Give You Up", length: 253, play_count: 98762452)

    award_1 = Award.create(name: "Awsome")
    award_2 = Award.create(name: "Cool")
    award_3 = Award.create(name: "Lovely")

    song_award_1 = AwardYear.create(year: 1990, award_id: award_1.id, song_id: song_1.id)
    song_award_2 = AwardYear.create(year: 1991, award_id: award_2.id, song_id: song_1.id)
    song_award_3 = AwardYear.create(year: 1993, award_id: award_1.id, song_id: song_2.id)
    song_award_4 = AwardYear.create(year: 1992, award_id: award_3.id, song_id: song_2.id)

    visit awards_path

    click_on award_1.name
    expect(page).to have_content(award_1.name)
    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_2.title)
    expect(page).to have_content(song_award_1.year)
    expect(page).to have_content(song_award_3.year)
  end
end
