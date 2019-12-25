Rails.application.routes.draw do
  get 'utilities/new'
  get 'utilities/index'
  get 'utilities/show'
  root 'home#index'

  resources :utilities

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
