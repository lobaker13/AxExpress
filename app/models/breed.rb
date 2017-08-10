class Breed < ApplicationRecord
  enum species: [:canine, :feline]
  has_many :patients

  # Helper to allow nil in species id for clinical_dose table to apply the dose without it being species specific
  def clinical_dose drug_id
    result = ClinicalDose.where( drug_id: drug_id, species_id: [self.species, nil])
    result.any? ? result.first : nil
  end
end
