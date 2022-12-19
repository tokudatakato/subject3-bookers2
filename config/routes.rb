Rails.application.routes.draw do
  resources :users
  resources :books
  devise_for :users
  get 'homes/about', as: 'about'
  get 'homes/top', as: 'top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
