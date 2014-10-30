Rails.application.routes.draw do
  get 'angular/index'
  root 'angular#index'

  resources :products
  resources :categories
end
