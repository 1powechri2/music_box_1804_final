require 'rails_helper'

describe AwardYear, type: :model do
  describe 'relationships' do
    it{should belong_to(:song)}
    it{should belong_to(:award)}
  end
end
