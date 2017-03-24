Rails.application.routes.draw do
  devise_for :users
  root 'members#index'

  resources :members
end
