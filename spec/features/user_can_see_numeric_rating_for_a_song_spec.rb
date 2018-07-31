require 'rails_helper'

describe 'user visits song show page' do
  it 'sees a numeric rating for a song 1 - 5' do
    artist = Artist.create(name: 'the doods')
    song = artist.songs.create(title: 'Blob', length: 56, play_count: 454, rating: 4)

    visit song_path(song)

    expect(page).to have_content(song.title)
    expect(page).to have_content(song.length)
    expect(page).to have_content(song.play_count)
    expect(page).to have_content(song.rating)
  end
end
