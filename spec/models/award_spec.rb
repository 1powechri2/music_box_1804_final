require 'rails_helper'

describe Award, type: :model do
  describe 'relationships' do
    it{should have_many(:award_years)}
    it{should have_many(:songs).through(:award_years)}
  end
end
