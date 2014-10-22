Betastore::Application.routes.draw do
  resources :subscriptions

  namespace :admin do
    get '/products/new' => 'products#new', as: 'new_product'
    get '/products/:id' => 'products#show', as: 'product'
    get '/products' => 'products#index'
  end

  root :to => 'subscriptions#new'

end
