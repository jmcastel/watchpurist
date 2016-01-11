Rails.application.routes.draw do
  

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :posts do 
  	resources :private_messages, except: [:index]

  end

   
  root 'posts#index'

  get 'dashboard' => 'dashboard#index' 
  get 'messages' => 'private_messages#index'

  
  resources :notifications do 
  	collection do
  		post :mark_as_read
  	end
  end

  get 'mywatches' => 'mywatches#index'

end
