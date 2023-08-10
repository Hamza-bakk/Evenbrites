Rails.application.routes.draw do
  root 'events#index'
  get '/contact', to: 'contact#contact' 
  
  devise_for :users
  resources :events 
  resources :users
  resources :charges

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
end

end
