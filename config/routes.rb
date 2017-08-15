Rails.application.routes.draw do
  resources :clinical_doses
  resources :protocol_drugs
  get 'patient_procedures/new(/:patient_id)' => 'patient_procedures#new', as: :new_patient_procedure
  resources :patient_procedures, except: [:new]
  resources :risks
  resources :protocols
  resources :drugs
  resources :patients
  resources :procedures
  resources :categories
  resources :breeds
  get '/references' => 'home#references'
  get '/about' => 'home#about'
  get '/patients' => 'patient#index', as: :user_root
  root to: "home#index"
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

end
