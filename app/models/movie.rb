class Movie < ApplicationRecord
  has_many :bookmarks
  validations :title, uniqueness: true, presence: true
  validates :overview, uniqueness: true, presence: true
end
