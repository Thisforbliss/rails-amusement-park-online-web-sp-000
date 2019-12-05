Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  '/signin' ,to: 'sessions#new'
  post '/session',to: 'sessions#create'
  get  '/user'   ,to: 'users#show'
  get  '/'       ,to: 'users#new'
  #Was not supposed to hardcode users/1?
  
  resources :users
end
