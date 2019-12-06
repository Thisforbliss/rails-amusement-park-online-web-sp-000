Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  '/signin' ,to: 'sessions#new'
  post '/session',to: 'sessions#create' 
  root  'sessions#index'
  
  resources :users
end
