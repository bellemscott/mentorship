Rails.application.routes.draw do
  resources :matches
  resources :mentees
  resources :mentors
  resources :users
  root 'welcome#index'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  get     '/additional-info', to: 'users#additional_info'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  #post '/signup', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
