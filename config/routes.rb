Rails.application.routes.draw do
	root 'publications#index' 
	get 'publications/index' => 'publications#index'
	delete 'publications/header' => 'users#logout'

	get 'categories/create' => 'categories#create'
post 'categories/create' => 'categories#new'
  get 'publications/create' => 'publications#create'
  post 'publications/create' => 'publications#new'
	
  get 'publications/hier' => 'publications#hier'
  get 'publications/aujourdhui' => 'publications#aujourdhui'
  get 'publications/demain' => 'publications#demain'

  get 'publications/:id' => 'publications#show'

  post 'publications/:id' => 'commentaires#new'
  delete 'publications/:id/commentaires/:id' => 'commentaires#destroy'

resources :users, only: [:new, :create]
get 'users/login' => 'users#login'
post 'users/login' => 'users#check'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
