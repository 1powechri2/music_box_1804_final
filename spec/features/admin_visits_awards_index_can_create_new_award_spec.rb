require 'rails_helper'

describe 'Admnin visits award index' do
  it 'can create a new award' do
    award_1 = Award.create(name: "iuyper")
    award_2 = Award.create(name: "kjhfdg")
    award_3 = Award.create(name: "kjhfgsfdg")
    admin = User.create(username: 'dood', password: '786afd', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit awards_path

    click_on("Create a New Award")

    fill_in :award_name, with: 'It be Ok'

    click_on("Create Award")

    expect(current_path).to eq(awards_path)
    expect(page).to have_content('It be Ok')
  end
end
describe 'unregistered user visits award index' do
  it 'cannot see create a new award link' do
    award_1 = Award.create(name: "iuyper")
    award_2 = Award.create(name: "kjhfdg")
    award_3 = Award.create(name: "kjhfgsfdg")

    visit awards_path

    expect(page).to_not have_content("Create a New Award")
  end
end
