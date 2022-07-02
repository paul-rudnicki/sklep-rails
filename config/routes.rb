Rails.application.routes.draw do

  get 'cart/show'
  get 'cart/edit'
  get 'cart/confirmation'

  resource :cart, controller: "cart", only: [:show, :update, :edit] do
    member do
      post :add_product
      post :remove_product
    end
  end

  namespace :admin do
    root to: 'products#index'
    resources :categories
    resources :products
    # get 'categories/index'
    # get 'categories/new'
    # get 'categories/edit'
  end
  # namespace :admin do
  #   # get 'products/index'
  #   # get 'products/new'
  #   # get 'products/edit'
  # end

  root 'products#index'

  get '/regulamin', to: 'statics#terms', as: 'terms'
  get '/polityka-prywatnosci', to: 'statics#privacy', as: 'privacy'
  get '/dostawa', to: 'statics#shipping', as: 'shipping'
  get '/o-sklepie', to: 'statics#about', as: 'about'

  resources :products, only: [:index, :show], path: 'produkt'
  resources :categories, only: [:show], path: 'kategoria'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
