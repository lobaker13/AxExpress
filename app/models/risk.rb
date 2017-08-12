class Risk < ApplicationRecord
  belongs_to :patient_procedure
  validates :bcs, inclusion: 1..9
  validates :asa, inclusion: 1..5
  # validates :heart_murmur, inclusion: 1..5
  def warnings
    risks = []
    risks.push("ASA") if asa_risk >= 3
    # Use of regex to isolate certain pharases
    risks.push("temperament") if temperament =~
     /aggressive|fractious|nervous|anxious|mean/
    risks.push("BCS") if bcs_risk <=3 or bcs_risk >= 7
    risks.push(breed_risk) if breed_risk
    risks.push("age") if age <= 1 or age >= 1
    # add status to procedure table
    risk.push("procedure") if self.patient_procedure.procedure.name.status == 1
    risk.push("comorbidities") if comorbidities =~ /Liver Disease|Renal Disease|Cardiac Disease|Diabetes/
    risks
  end

# helper to flag more alerts
# def method_name
# end

  def asa_risk
    (1..5)
  end

  def breed_risk
  #when/when case for different risk breeds
    case self.patient.breed.name
      # Brachycephalic
    when "Bulldog","French Bulldog","Pug","Boston Terrier","Pekingese","Boxer","Lhasa Apso","Shih Tzu","Cavalier King Charles Spaniel","Bullmastiff","","Persian"

      "Extubation shouldn’t be attempted until the pet is awake, alert and swallowing. Removing the tube while the animal is still groggy from anesthesia increases the risk for upper airway obstruction."
      # Sighthounds
    when "Greyhound","Whippet","Afghan Hound","Borzoi","Irish Wolfhound"
        ""
      # Herding (MDR1)
    when
      "Collie","Australian Shepherd","Shetland Sheepdog"

        "Often have a genetic mutation in the ABCB1 (formerly MDR1) gene that allows certain drugs to accumulate in the brain – including some anesthesia agents. Without proper dosing and monitoring, these breeds can be over-sedated and experience respiratory depression."

      # Toy Breeds
    when
      "Affenpinscher","Brussels Griffon","Cavalier King Charles Spaniel","Chihuahua","Chinese Crested","English Toy Spaniel","Havanese","Italian Greyhound","Japanese Chin","Maltese","Manchester Terrier","Miniature Pinscher","Papillon","Pekingese","Pomeranian","Pug","Shih Tzu","Silky Terrier","Toy Fox Terrier","Yorkshire Terrier"

        "Toy dogs must be carefully weighed and the appropriate dose of anesthetic given based on their small size. Monitoring during the procedure is crucial (as it is for all patients, but in particular the tiny ones), including accurate blood pressure measurement.

        Small dogs tend to have low body temps and hypoglycemia (low blood sugar), so it’s also important they be kept warm while anesthetized and their blood glucose levels monitored."
      # Giant Breeds
    when
      "Great Dane","Mastiff","Newfoundland","Saint Bernard","Great Pyrenees","Irish Wolfhound","Giant Schnauzer","Leonberger","Neapolitan Mastiff","Greyhound","Scottish Deerhound","Kuvasz"

        "May over-respond to normal therapeutic doses of sedatives. It’s important that these dogs are dosed according to lean body mass or surface area rather than actual body weight."
    when
      "Doberman Pinscher"

        "Dobies tend to have a genetic variation which can cause von Willebrand disease, a problem with blood clotting. They also have a predisposition to develop dilated cardiomyopathy.

        Dobermans should be evaluated for both conditions before any surgery is scheduled. Use of NSAIDs (non-steroidal anti-inflammatory drugs) in Dobies with von Willebrand disease is controversial, so other types of painkilling agents should be considered."
  end

  # def cardiac_risk
  #   case heart_murmur
  #   when
  #   end
  end
end
