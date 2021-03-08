Rails.application.routes.draw do
  resources :mentors
  resources :users
  root 'users#new'
  get  '/signup',  to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
