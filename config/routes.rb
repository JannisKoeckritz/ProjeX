Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'landing#index'
  get 'myprofile', to: 'users#show'
 	resources :projects, only: [:create, :show, :update, :edit, :destroy, :new]
 	get 'myprojects', to: 'projects#index'
 	resources :todos, only: [:create, :show, :update, :edit, :destroy, :new]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
