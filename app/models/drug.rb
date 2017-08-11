class Drug < ApplicationRecord
  include AttrBitwise

@@routes_of_admin = { iv: "Intravenous",
                      im: "Intramuscular",
                      sc: "Subcutaneous",
                      po: "Orally",
                      inh: "Inhalational"}
 attr_bitwise :route_of_admin, mapping: @@routes_of_admin.keys

 has_many :protocol_drugs
 has_many :protocols, through: :protocol_drugs
 has_many :clinical_doses

# Since we have an array, need to loop through instead of running through a hash. Hence the "|roa|"
 def route_of_admin_expand
   self.route_of_admin.map{|roa| @@routes_of_admin[roa.to_sym] }
 end

 # def method_name
 #
 # end

# For future use to call both canine and feline in species specific dosing
# def both_species
#   Breed.species.map
# end

 def self.search search_term
   where(['name LIKE ? OR commercial_name LIKE ?', "%#{search_term}%", "%#{search_term}%"])
 end

end
