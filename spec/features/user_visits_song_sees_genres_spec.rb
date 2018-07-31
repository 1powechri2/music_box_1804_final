require 'rails_helper'

describe 'a user visits a song show page' do
  it 'sees the genres asscoiated with that song' do
    user = User.create(username: 'dood', password: '786afd', role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    band = Artist.create(name: "Pet Shop Boys")

    song = band.songs.create(title: "Yuore", length: 320, play_count: 390808)

    genre_1 = Genre.create(name: "Music")
    genre_2 = Genre.create(name: "Not Music")
    genre_2 = Genre.create(name: "Bad Music")

    genre_song_1 = GenreSong.create(song_id: song.id, genre_id: genre_1.id)
    genre_song_2 = GenreSong.create(song_id: song.id, genre_id: genre_1.id)
    genre_song_3 = GenreSong.create(song_id: song.id, genre_id: genre_2.id)

    visit song_path(song)

    expect(page).to have_content(song.title)
    expect(page).to have_content("Genres for this Song: #{genre_1.name}")
    expect(page).to have_content("Genres for this Song: #{genre_2.name}")
    expect(page).to_not have_content("Genres for this Song: #{genre_3.name}")
  end
end
