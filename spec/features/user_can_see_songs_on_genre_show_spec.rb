require 'rails_helper'

describe 'a user visits a genre show page' do
  it 'sees the songs asscoiated with that genre' do
    user = User.create(username: 'dood', password: '786afd', role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    band = Artist.create(name: "Pet Shop Boys")

    song_1 = band.songs.create(title: "Yuore", length: 320, play_count: 390808)
    song_2 = band.songs.create(title: "GH", length: 50, play_count: 89756)
    song_3 = band.songs.create(title: "IOP", length: 8, play_count: 2567)

    genre_1 = Genre.create(name: "Music")
    genre_2 = Genre.create(name: "Not Music")

    genre_song_1 = GenreSong.create(song_id: song_1.id, genre_id: genre_1.id)
    genre_song_2 = GenreSong.create(song_id: song_2.id, genre_id: genre_1.id)
    genre_song_3 = GenreSong.create(song_id: song_3.id, genre_id: genre_2.id)

    visit genre_path(genre_1)

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(song_1.title)
    expect(page).to have_content(song_2.title)
    expect(page).to_not have_content(song_3.title)
  end
end
