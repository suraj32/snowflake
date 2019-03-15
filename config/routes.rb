Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'uploads/get_roles', to: 'uploads#get_roles'
  get 'uploads/get_track_categories', to: 'uploads#get_track_categories'
  get 'uploads/get_tracks', to: 'uploads#get_tracks'
  resources :uploads
  root 'uploads#new'
end
