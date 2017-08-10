Rails.application.routes.draw do
  resources :clinical_doses
  resources :protocol_drugs
  resources :patient_procedures
  resources :risks
  resources :protocols
  resources :drugs
  resources :patients
  resources :procedures
  resources :categories
  resources :breeds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

end
