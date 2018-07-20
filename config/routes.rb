Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'user/registrations', sessions: 'user/sessions'}
  resources :projects do
  	resources :tasks do
  		resources :users
  	end
  end
  devise_scope :user do
  	root 'devise/sessions#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
