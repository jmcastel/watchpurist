Rails.application.routes.draw do
  

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :posts do 
  	resources :private_messages, except: [:show, :index]
  end
  root 'posts#index'

  get 'dashboard' => 'dashboard#index' 

  get 'messages' => 'messages#index'

  get 'mywatches' => 'mywatches#index'

end
