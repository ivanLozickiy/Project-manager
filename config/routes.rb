Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'user/registrations', sessions: 'user/sessions'}
  resources :projects do
  	resources :tasks 
  end
  resources :users
  devise_scope :user do
  	root 'devise/sessions#new'
  end
  resources :tasks do
  	member do
  		get :change_status
  		post :change_status
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
