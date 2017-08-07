json.extract! patient, :id, :fname, :lname, :dob, :sex, :weight, :breed_id, :user_id, :created_at, :updated_at
json.url patient_url(patient, format: :json)
