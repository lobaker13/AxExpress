class ClinicalDose < ApplicationRecord
  belongs_to :drug

  # To output breed specific dosing
  def species_output
   case self.species_id
   when 0
     "Canine"
   when 1
     "Feline"
   when nil
     "Canine&Feline"
  end
end

  def min_unit
    " #{min}" + "mg/kg"
  end

  def max_unit
    " #{max}" + "mg/kg"
  end

  def range
    " #{min}mg/kg" + " - " + "#{max}mg/kg"
  end

  def average
    ((self.min + self.max) / 2)
  end
end
