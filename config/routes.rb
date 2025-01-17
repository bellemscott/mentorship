Rails.application.routes.draw do
  resources :messages
  resources :rooms
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :matches
  resources :mentees
  resources :mentors
  resources :users
  resources :states, only: :index
  root 'matches#home'
  get '/room', to: 'rooms#index'
  post 'room/create', to: 'rooms#create'
  get  '/signup',  to: 'users#new'
  get  '/channelshow',  to: 'channnel_users#show'
  post 'channel_users/create'
  get  '/home',  to: 'matches#home'
  get '/menteeprofile/:id', to: 'mentees#show', as: 'menteeprofile'
  get '/mentorprofile/:id', to: 'mentors#show', as: 'mentorprofile'
  get '/userprofile/:id', to: 'users#show', as: 'userprofile'
  get    '/login',   to: 'sessions#new'
  get    '/explore',   to: 'welcome#show'
  get     '/additional-info', to: 'users#additional_info'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post 'matches/create'
  post 'welcome/accept', to: 'welcome#accept'  #for rejecting matches
  post 'welcome/reject', to: 'welcome#reject'    #for accepting matches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
