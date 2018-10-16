Rails.application.routes.draw do
  root 'games#index'
  get 'tops/index'

  devise_for :users

  resources :users, only: %i[show index]

  resources :games

  resources :favorites, only: [:create, :destroy]
  resources :entries, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
