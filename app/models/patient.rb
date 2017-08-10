class Patient < ApplicationRecord
  @@sexes = { mi: "Male, intact",
              mn: "Male, neutered",
              fi: "Female, intact",
              fs: "Female, spayed"}
  enum sex: @@sexes.keys

  def full_name
    "#{fname} #{lname}".strip
  end

  def self.sexes_hash
    @@sexes
  end
  def sex_expand
    @@sexes[self.sex.to_sym]
  end

  def weight_kg
    "#{weight}" + "kg"
  end
  belongs_to :breed
  belongs_to :user
  has_many :procedures, through: :patient_procedure
end
