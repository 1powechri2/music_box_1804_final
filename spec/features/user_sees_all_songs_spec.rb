require 'rails_helper'

describe 'user index' do
  it 'user can see all songs' do
    artist = Artist.create(name:'Adele')
    song_1 = artist.songs.create(title: "Don't Stop Believin", length: 303, play_count: 123456)
    song_2 = artist.songs.create(title: "Never Gonna Give You Up", length: 253, play_count: 98762452)

    visit songs_path

    expect(page).to have_content("All Songs")
    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Plays: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Plays: #{song_2.play_count}")
  end
  it 'can see the awards for each song' do
    artist = Artist.create(name:'Adele')
    song_1 = artist.songs.create(title: "Don't Stop Believin", length: 303, play_count: 123456)
    song_2 = artist.songs.create(title: "Never Gonna Give You Up", length: 253, play_count: 98762452)

    award_1 = Award.create(name: "Awsome")
    award_2 = Award.create(name: "Cool")
    award_3 = Award.create(name: "Lovely")

    song_award_1 = AwardYear.create(year: 1990, award_id: award_1.id, song_id: song_1.id)
    song_award_2 = AwardYear.create(year: 1991, award_id: award_2.id, song_id: song_1.id)
    song_award_3 = AwardYear.create(year: 1990, award_id: award_1.id, song_id: song_2.id)
    song_award_4 = AwardYear.create(year: 1992, award_id: award_3.id, song_id: song_2.id)

    visit songs_path

    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_1.awards[0].name)
    expect(page).to have_content(song_1.award_years[0].year)
    expect(page).to have_content(song_1.awards[1].name)
    expect(page).to have_content(song_1.award_years[1].year)
    expect(page).to have_content(song_2.title)
    expect(page).to have_content(song_2.awards[0].name)
    expect(page).to have_content(song_2.award_years[0].year)
    expect(page).to have_content(song_2.awards[1].name)
    expect(page).to have_content(song_2.award_years[1].year)
  end
end
