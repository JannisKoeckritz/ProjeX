Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'landing#index'
  get 'myprofile', to: 'users#show'
 	resources :projects, only: [:create, :show, :update, :edit, :destroy, :new]
 	get 'myprojects', to: 'projects#index'
 	get 'mytodos', to: 'todos#index'
 	get 'add_todo', to: 'todos#add'
 	get 'add_to_project', to: 'projects#add_member'
 	resources :projects, only: [:search] do
 		get 'search'
 	end
 	get 'search_member', to: 'projects#user_search'
 	resources :todos, only: [:create, :show, :update, :edit, :destroy, :new]
 	get 'mytodos/export', to: 'export#export'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
