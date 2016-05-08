Rails.application.routes.draw do

  root 'home#index'

  resources :users, :only => [:index, :new, :create] #do

    # resources :products, :only => [:show, :new]
  # end

  resources :products, :only => [:index, :show, :create]

  get '/products/category/:category' => 'products#show_category', as: 'product_category'
  get '/products/:full_name/:id' => 'products#show_merchant', as: 'product_merchant'
  get '/users/:id/products/new' => 'products#new', as: 'new_product'
  post '/users/:id/products' => 'products#create'
  get '/users/:id/products/:id/edit' => 'products#edit', as: 'edit_product'
  patch '/users/:user_id/products' => 'products#update', as: 'update_product'
  get '/users/:id/products' => 'products#show_seller_products', as: 'user_product'
  resources :orders

  get '/users/:id/orders' => 'orders#show_seller_orders', as: 'show_seller_orders'
  get '/users/:id/orders/seller_items' => 'orders#seller_items', as: 'seller_items'

  resources :orderitems

  get 'orders/order_fulfillment' => 'orders#index', as: 'order_fulfillment'


  resources :sessions, :only => [:new, :create]
  get "/logout" => "sessions#destroy"
  get "/orders/:id/checkout" => 'orders#checkout', as: 'order_checkout'
  patch "/orders/:id/checkout" => "orders#confirmation" as: 'order_confirmation'
  get '/orders/:id/confirmation' => 'orders#confirmation', as: "order_confirmation"

end
