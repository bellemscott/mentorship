Rails.application.routes.draw do
  resources :mentors
  resources :users
  root 'welcome#index'
  get  '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
