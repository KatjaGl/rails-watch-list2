class List < ApplicationRecord
  has_many :bookmarks
  has_many :movies, through: :bookmarks
  validations :name, uniqueness: true, presence: true
end
