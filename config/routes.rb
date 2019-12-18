Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  '/signin' ,to: 'sessions#new'  
  post '/session',to: 'sessions#create' 
  root  'sessions#index'
  post  '/rides', to: 'rides#create'
  get '/attractions/new', to: 'attractions#new'
  get '/attractions/:id', to: 'attractions#show'
  post '/html', to: 'attractions#update'

  #get '/attractions', to: 'attractions#index', controller: :attractions
  resources :attractions
  resources :users do
    post  '/delete', to: 'sessions#destroy'
  end
end
