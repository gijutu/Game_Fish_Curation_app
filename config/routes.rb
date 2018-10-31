Rails.application.routes.draw do
  root 'games#index'
  get 'searchs/index'
  get 'tops/index'
  mount RailsAdmin::Engine, at:'/admin', as: 'rails_admin'

  devise_for :users

  resources :users, only: %i[show index edit update]

  resources :games do
    resources :comments
  end

  resources :favorites, only: [:create, :destroy]
  resources :entries, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
