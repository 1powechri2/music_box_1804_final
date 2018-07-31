require 'rails_helper'

describe 'Admnin visits genre index' do
  it 'can create a new genre' do
    genre_1 = Genre.create(name: "Rock")
    genre_2 = Genre.create(name: "Blues")
    genre_3 = Genre.create(name: "Japanese Noise Music")
    admin = User.create(username: 'dood', password: '786afd', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit genres_path

    click_on("Create a New Genre")

    fill_in :genre_name, with: 'Grind Core'

    click_on("Create Genre")

    expect(current_path).to eq(genres_path)
    expect(page).to have_content('Grind Core')
  end
end
