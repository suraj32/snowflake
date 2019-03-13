Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'uploads/get_role_types', to: 'uploads#get_role_types'
  get 'uploads/get_track_category_types', to: 'uploads#get_track_category_types'
  resources :uploads
  root 'uploads#new'
end
