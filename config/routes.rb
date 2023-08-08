Rails.application.routes.draw do
  root 'events#index'
  get '/contact', to: 'contact#contact' 
  
  devise_for :users
  resources :events 
  resources :users

end
