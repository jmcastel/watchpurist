Rails.application.routes.draw do
  

  devise_for :users, :controllers => { registrations: 'registrations' }

  as :user do
    get 'users', :to => 'users#index', :as => :user_root # Rails 3
    get 'users/:id',      to: 'users#show',    as: :single_user
  end

  resources :posts do 
  	resources :private_messages, except: [:index]

  end

   
  root 'posts#index'

  get 'dashboard' => 'dashboard#index' 
  get 'messages' => 'private_messages#index'
  get 'hello' => 'hello#index'

  
  resources :notifications 
  	
  

  get 'mywatches' => 'mywatches#index'

end
