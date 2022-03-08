Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root to: 'welcome#index'
  
  devise_for :users, controllers: { sessions: "users/sessions" }

  resources :temples
  resources :temple_history_details
  resources :offline_city_centres
  resources :worships
  resources :devoters
  resources :events
  get 'single_temple_detail', controller: 'temples', action: 'single_temple_detail'
  resources :photo_video_galleries
  post 'upload_photo', controller: 'photo_video_galleries', action: 'upload_photo'
  post 'upload_video', controller: 'photo_video_galleries', action: 'upload_video'
  get 'fetch_single_temple_images', controller: 'photo_video_galleries', action: 'fetch_single_temple_images'
  get 'fetch_single_temple_history_detail', controller: 'temple_history_details', action: 'fetch_single_temple_history_detail'
  get 'fetch_single_temple_events', controller: 'events', action: 'fetch_single_temple_events'
  get 'fetch_single_worship_detail', controller: 'worships', action: 'fetch_single_worship_detail'
end
