class Award < ApplicationRecord
  has_many :award_years
  has_many :songs, through: :award_years


  def find_award_year(song_id)
    AwardYear.where('award_id=?', id).where('song_id=?', song_id).first.year
  end
end
