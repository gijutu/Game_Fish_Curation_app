Rails.application.routes.draw do
  devise_for :users
  root 'games#index'
  resources :games
  get 'tops/index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
