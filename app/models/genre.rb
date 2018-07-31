class Genre < ApplicationRecord
  has_many :genre_songs
  has_many :songs, through: :genre_songs
end
