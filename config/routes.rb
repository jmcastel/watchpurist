Rails.application.routes.draw do
  

  devise_for :users, :controllers => { registrations: 'registrations' }

  as :user do
    get 'users', :to => 'users#index' # Rails 3
    get 'users/:id',      to: 'users#show',    as: :single_user
  end



  #resources :posts ,path: 'watch', only: [:new, :edit]

  root 'posts#index'

  get 'dashboard' => 'dashboard#index' 
  get 'messages' => 'private_messages#index'
  get 'hello' => 'hello#index'
  get  'watch/:id' ,to: redirect('/%{id}')
  
  resources :notifications 
    
  

  get 'mywatches' => 'mywatches#index'

  resources :posts ,path: '' do 
  	resources :private_messages, except: [:index]

  end





   
  

end
