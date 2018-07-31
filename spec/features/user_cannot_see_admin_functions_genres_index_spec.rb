require 'rails_helper'

describe 'a user who is not admin visits genres index' do
  it 'does not see the admin create function' do
    user = User.create(username: 'dood', password: '786afd', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    genre_1 = Genre.create(name: "Rock")
    genre_2 = Genre.create(name: "Blues")
    genre_3 = Genre.create(name: "Japanese Noise Music")

    visit genres_path

    expect(page).to_not have_content("Create a New Genre")
  end
  it 'can click a genre name to go to that genres show' do
    user = User.create(username: 'dood', password: '786afd', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    genre_1 = Genre.create(name: "Rock")
    genre_2 = Genre.create(name: "Blues")
    genre_3 = Genre.create(name: "Japanese Noise Music")

    visit genres_path

    click_on genre_1.name

    expect(current_path).to eq(genre_path(genre_1))
    expect(page).to have_content(genre_1.name)
  end
end
