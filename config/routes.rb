Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch '/capture' => 'pokemons#capture'
  patch '/damage' => 'pokemons#damage'
  get '/pokemon/new' => 'pokemons#new'
  post '/pokemon/create' => 'pokemons#create'
end
