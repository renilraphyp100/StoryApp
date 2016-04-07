
Rails.application.routes.draw do
  
  resources :authors
  resources :stories
  
  post 'create_author_ajax' => 'authors#create_author_ajax'
  
  root 'authors#index'

end
