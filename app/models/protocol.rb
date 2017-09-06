class Protocol < ApplicationRecord
  belongs_to :patient
  has_many :protocol_drugs
  has_many :drugs, through: :protocol_drugs
  before_destroy do |protocol|
    protocol.protocol_drugs.destroy_all
  end
    def add_drug( drug_id)
    drug = Drug.find( drug_id )
    ProtocolDrug.create(
      protocol_id: self.id,
      drug_id: drug_id,
      dose: self.patient.dosing(drug)
    )
end
  # def add_roa( route_of_admin )
  #
  # end
end
