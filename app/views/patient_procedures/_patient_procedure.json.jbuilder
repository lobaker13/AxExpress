json.extract! patient_procedure, :id, :procedure_id, :patient_id, :created_at, :updated_at
json.url patient_procedure_url(patient_procedure, format: :json)
