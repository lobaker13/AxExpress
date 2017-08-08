class Protocol < ApplicationRecord
  belongs_to :patient
  has_many :protocol_drugs
  has_many :drugs, through: :protocol_drugs
end
