Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  '/signin' ,to: 'sessions#new'
  post '/session',to: 'sessions#create' 
  root  'sessions#index'
  #get '/attractions', to: 'attractions#index', controller: :attractions
  resources :attractions
  resources :users do
    post  '/delete', to: 'sessions#destroy'
  end
end
