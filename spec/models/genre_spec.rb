require 'rails_helper'

describe Genre do
  describe 'relationships' do
    it {should have_many(:genre_songs)}
    it {should have_many(:songs).through(:genre_songs)}
  end
end
