Rails.application.routes.draw do
  resources :drugs
  resources :patients
  resources :procedures
  resources :categories
  resources :breeds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
