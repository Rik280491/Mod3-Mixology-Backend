Rails.application.routes.draw do
  resources :combinations
  resources :measures
  resources :ingredient_cocktails
  resources :ingredients
  resources :user_cocktails
  resources :cocktails
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
