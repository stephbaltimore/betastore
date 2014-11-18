Betastore::Application.routes.draw do
  resources :subscriptions
  # resources :customers
  resources :products do
    member do
      post 'add_to_cart'
    end
  end



  namespace :admin do
    resources :products
    # get '/products/new' => 'products#new', as: 'new_product'
    # get '/products/:id' => 'products#show', as: 'product'
    # get '/products' => 'products#index'
    # post '/products' => 'products#create'
    get  '/login' => 'logins#new', as: 'login'
    post '/login' => 'logins#create'
  end

  root :to => 'subscriptions#new'

end
