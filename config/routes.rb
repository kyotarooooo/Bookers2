Rails.application.routes.draw do
	#root 'users#show'
	get '' => 'books#top', as: 'top_book'
	get 'home/about' => 'users#top', as: 'top_user'
  	devise_for :users

	resources :books
	resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
