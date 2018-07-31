require 'rails_helper'

describe GenreSong do
  describe 'relationships' do
    it {should belong_to(:genre)}
    it {should belong_to(:song)}
  end
end
