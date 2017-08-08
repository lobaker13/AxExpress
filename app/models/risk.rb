class Risk < ApplicationRecord
  belongs_to :patient_procedure

  def warnings
    risks = []
    risks.push("ASA") if asa_risk >= 3
    # Use of regex to isolate certain pharases
    risks.push("temperament") if temperament =~
     /aggressive|fractious|stupid|mean|disease|ugly/
    risks.push("BCS") if bcs_risk <=3 or bcs_risk >= 7
    risks.push(breed_risk) if breed_risk
    risks.push("age") if age >= 10 or age <= 1
    # add status to procedure table
    risk.push("procedure") if self.patient_procedure.procedure.name.status == 1
    risk.push("comorbidities") if comorbidities =~ /Liver disease|Renal disease|/
    risks
  end
  def asa_risk
    (1..5)

  end
  def breed_risk
  #when/when case for different risk breeds
    case self.patient.breed.name
      # Brachycephalic
    when "greyhound","",""
      "Sensitive to opioids"
      # Sighthounds
    when ""
      # Giant Breeds
    when
      # Toy Breeds
  end

end
