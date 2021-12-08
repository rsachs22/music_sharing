Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "songs#index"
  resources :album_reviews
  resources :song_reviews
  resources :genres
  resources :artists
  resources :albums
  resources :songs
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
