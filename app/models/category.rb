class Category < ApplicationRecord
  @@cores = { abdom: "Abdominal",
              gas: "Gastrointestinal Surgery",
              head: "Head/Neck Surgery",
              mis: "Minimally Invasive Surgery",
              neuro: "Neurologic Surgery ",
              ortho: "Orthopedic Surgery",
              skin: "Skin/Reconstructive Surgery",
              thor: "Thoracic Surgery ",
              uro: "Urogenital"}
  enum core: @@cores.keys

  # For calling what is the full name later
  def core_expand
    @@cores[self.core.to_sym]
  end

  has_many :procedures
end
