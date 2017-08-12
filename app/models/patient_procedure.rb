class PatientProcedure < ApplicationRecord
  belongs_to :procedure
  belongs_to :patient
  has_one :risk
#
# def name
#   "#{procedure.name}".strip
# end
end
