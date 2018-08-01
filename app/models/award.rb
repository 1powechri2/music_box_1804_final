class Award < ApplicationRecord
  has_many :award_years
  has_many :songs, through: :award_years


  def find_award_year
    AwardYear.where('award_id=?', id).first.year
  end
end
