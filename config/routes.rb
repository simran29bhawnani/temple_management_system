Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root to: 'welcome#index'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  # root to: 'temples#new'
  resources :temples
  resources :temple_history_details
  resources :offline_city_centres
  resources :worships
  resources :devoters
end

