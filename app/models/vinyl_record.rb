class VinylRecord < ActiveRecord::Base
  validates :artist, presence: true
  validates :album, presence: true
  validates :genre, presence: true
end
