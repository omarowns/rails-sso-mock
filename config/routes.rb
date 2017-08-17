Rails.application.routes.draw do
  root 'appointments#index'
  devise_for :users
  resources :appointments

  get 'saml/init'
  get 'saml/consume'
  get 'saml/metadata'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
