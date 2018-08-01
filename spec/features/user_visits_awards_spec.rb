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
end
