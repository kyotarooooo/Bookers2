Rails.application.routes.draw do
  	devise_for :users
	get '' => 'books#top'

	resources :books
	resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
