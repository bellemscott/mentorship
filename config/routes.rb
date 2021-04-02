Rails.application.routes.draw do
  resources :matches
  resources :mentees
  resources :mentors
  resources :users
  resources :states, only: :index
  root 'welcome#index'
  get  '/signup',  to: 'users#new'
  get '/menteeprofile/:id', to: 'mentees#show', as: 'menteeprofile'
  get '/mentorprofile/:id', to: 'mentors#show', as: 'mentorprofile'
  get '/userprofile/:id', to: 'users#show', as: 'userprofile'
  #post  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  get    '/explore',   to: 'welcome#show'
  get     '/additional-info', to: 'users#additional_info'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  #post '/signup', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
