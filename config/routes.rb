Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root "products#index"
  resources :products

  get 'login/secret', to: 'login#secret', as: 'secret'
  get '/login', to: 'login#index', as: 'login'
  get 'cart', to: 'orders#cart', as: 'cart'
  post 'checkout', to: 'orders#checkout', as: 'checkout'
  get 'orders/:id', to: 'orders#show', as: 'order'
  patch '/update_cart', to: 'orders#update_cart', as: 'update_cart'
  delete '/remove_item_from_cart/:item_id', to: 'orders#remove_item_from_cart', as: 'remove_item_from_cart'
  delete '/orders/:id', to: 'orders#destroy'
  resources :products, only: [:index, :show]
  resources :orders, only: [:index, :show, :create] do
    member do
      delete :delete, action: :destroy, as: :delete
    end
  end
end
