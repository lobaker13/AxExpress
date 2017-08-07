class Breed < ApplicationRecord
  enum species: [:canine, :feline]
  has_many :patients
end
