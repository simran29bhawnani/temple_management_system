Rails.application.routes.draw do
  root to: 'temples#index'
  devise_for :users
end
