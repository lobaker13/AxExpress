class ProtocolDrug < ApplicationRecord
  belongs_to :drug
  belongs_to :protocol
end
