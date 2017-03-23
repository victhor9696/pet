class Breed < ApplicationRecord
  has_many :pets
  validates :name, presence: true, uniqueness: true
end
