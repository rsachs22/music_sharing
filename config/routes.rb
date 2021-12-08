Rails.application.routes.draw do
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
