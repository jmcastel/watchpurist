Rails.application.routes.draw do
  devise_for :users
  resources :posts
  
  root 'posts#index'

  get 'dashboard' => 'dashboard#index' 

end
