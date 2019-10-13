Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'
  get '/twitter', to: 'twitter#index'
  get '/refer/:id', to: 'referer#show'
  get '/reactions/:id', to: 'declares#reactions'
  post '/reactions', to: 'declares#countup'
  resources :declares

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
