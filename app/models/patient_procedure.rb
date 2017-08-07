class PatientProcedure < ApplicationRecord
  belongs_to :procedure
  belongs_to :patient
end
