Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'searchs/index'
  root 'games#index'
  get 'tops/index'

  devise_for :users

  resources :users, only: %i[show index edit update]

  resources :games

  resources :games do
    resources :comments
  end

  resources :favorites, only: [:create, :destroy]
  resources :entries, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
