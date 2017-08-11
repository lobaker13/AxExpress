class Patient < ApplicationRecord
  belongs_to :breed
  belongs_to :user
  has_many :procedures, through: :patient_procedure

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

  def dosing(drug, units = false)
    clinical_dose = self.breed.clinical_dose(drug.id)
    return nil unless clinical_dose
    calc = clinical_dose.average * self.weight
    units ? "#{calc} mg/kg" : calc
  end

  def volume(drug, units = false)
    calc = dosing(drug) / drug.concentration
    units ? "#{calc} ml" : calc
  end
end
