require 'rails_helper'

describe 'a user visits genre index' do
  it 'sees all the genres' do
    user = User.create(username: 'dood', password: '786afd', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    genre_1 = Genre.create(name: "Rock")
    genre_2 = Genre.create(name: "Blues")
    genre_3 = Genre.create(name: "Japanese Noise Music")

    visit genres_path

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
    expect(page).to have_content(genre_3.name)
  end
end
