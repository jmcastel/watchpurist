Rails.application.routes.draw do
  

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :posts do 
  	resources :private_messages, except: [:index]

  end

   
  root 'posts#index'

  get 'dashboard' => 'dashboard#index' 
  get 'messages' => 'private_messages#index'

  
  resources :notifications 
  	
  

  get 'mywatches' => 'mywatches#index'

end
