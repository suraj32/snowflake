Rails.application.routes.draw do
  get 'cycles/index'
  get 'cycles/new'
  get 'cycles/create'
  get 'cycles/update'
  get 'cycles/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index', as: 'intranet', via: :all
  scope path: 'snowflake' do
    get '/get_roles', to: 'uploads#get_roles'
    get '/get_track_categories', to: 'uploads#get_track_categories'
    get '/get_tracks', to: 'uploads#get_tracks'
    resources :uploads, :roles, :track_categories, :tracks, :levels, :cycles
    scope module: 'api' do
      namespace :v1 do
        resources :users
        get '/get_static_data', to: 'users#get_static_data'
        post '/create_assessment', to: 'users#create_assessment'
      end
    end
    root 'cycles#index'
  end
end