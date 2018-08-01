class Award <ApplicationRecord
  has_many :award_years
  has_many :songs, through: :award_years
end
