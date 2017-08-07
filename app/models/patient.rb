class Patient < ApplicationRecord
  @@sexes = { mi: "Male, intact",
              mn: "Male, neutered",
              fi: "Female, intact",
              fs: "Female, spayed"}
  enum sex: @@sexes.keys

  def sex_expand
    @@sexes[self.sex.to_sym]
  end
  
  belongs_to :breed
  belongs_to :user
  has_many :procedures, through: :patient_procedure
end
