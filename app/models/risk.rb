class Risk < ApplicationRecord
  belongs_to :patient_procedure
  validates :bcs, inclusion: 1..9
  validates :asa, inclusion: 1..5
  validates :heart_murmur, inclusion: 1..5, allow_nil:true
  before_create do |risk|
    risk.age = (Date.today - patient_procedure.patient.dob) / 365
  end
  def warnings
    risks = []
    risks.push("ASA") if asa_risk.include? asa
    # Use of regex to isolate certain pharases
    risks.push("temperament") if temperament =~
     /aggressive|fractious|nervous|anxious|mean/
    risks.push("BCS") if bcs <=3 or bcs >= 7
    risks.push(breed_risk) if breed_risk
    risks.push(age_risk) if age <= 1 or age >= 1
    # add status to procedure table
    risks.push("procedure") if self.patient_procedure.procedure.name == 1
    risks.push("comorbidities") if comorbidities =~ /Liver Disease|Renal Disease|Cardiac Disease|Diabetes/
    risks
  end

# helper to flag more alerts
# def method_name
# end
  def asa_risk
    (3..5)
  end


def self.age_risk age
  case
    when age < 1
    "PEDIATRIC: Pediatric patients have minimal glycogen stores in the liver and should be minimally fasted. "

    when age > 10
    "GERIATRIC: Anesthetic morbidity is increased because of a decline in organ function or reserve - the so-called 'elderly normal' patient. Under routine non-stressful conditions, the physiological changes that occur in body composition, the brain, kidney, liver, heart and lungs produce no or only minimal functional impairment. However, with acute disease or surgery, and hence stress, the diminished reserve capacity of elderly patients impairs their response to increased demand"
  end
end

  def self.breed_risk breed_name
  #when/when case for different risk breeds
    case breed_name
      # Brachycephalic
    when "Bulldog","French Bulldog","Pug","Boston Terrier","Pekingese","Boxer","Lhasa Apso","Shih Tzu","Cavalier King Charles Spaniel","Bullmastiff","","Persian"

      "Extubation shouldn’t be attempted until the pet is awake, alert and swallowing. Removing the tube while the animal is still groggy from anesthesia increases the risk for upper airway obstruction."
      # Sighthounds
    when "Greyhound","Whippet","Afghan Hound","Borzoi","Irish Wolfhound"
        ""
      # Herding (MDR1)
    when
      "Collie","Australian Shepherd","Shetland Sheepdog"

        "HERDING BREED: Often have a genetic mutation in the ABCB1 (formerly MDR1) gene that allows certain drugs to accumulate in the brain – including some anesthesia agents. Without proper dosing and monitoring, these breeds can be over-sedated and experience respiratory depression."

      # Toy Breeds
    when
      "Affenpinscher","Brussels Griffon","Cavalier King Charles Spaniel","Chihuahua","Chinese Crested","English Toy Spaniel","Havanese","Italian Greyhound","Japanese Chin","Maltese","Manchester Terrier","Miniature Pinscher","Papillon","Pekingese","Pomeranian","Pug","Shih Tzu","Silky Terrier","Toy Fox Terrier","Yorkshire Terrier"

        "TOY BREED: Toy dogs must be carefully weighed and the appropriate dose of anesthetic given based on their small size. Monitoring during the procedure is crucial (as it is for all patients, but in particular the tiny ones), including accurate blood pressure measurement.

        Small dogs tend to have low body temps and hypoglycemia (low blood sugar), so it’s also important they be kept warm while anesthetized and their blood glucose levels monitored."
      # Giant Breeds
    when
      "Great Dane","Mastiff","Newfoundland","Saint Bernard","Great Pyrenees","Irish Wolfhound","Giant Schnauzer","Leonberger","Neapolitan Mastiff","Greyhound","Scottish Deerhound","Kuvasz"

        "GIANT BREED: May over-respond to normal therapeutic doses of sedatives. It’s important that these dogs are dosed according to lean body mass or surface area rather than actual body weight."
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
# To call on the class method defined above
  def breed_risk
    Risk.breed_risk self.patient_procedure.patient.breed.name
  end
  def age_risk
    Risk.age_risk self.patient_procedure.patient.age
  end
end
