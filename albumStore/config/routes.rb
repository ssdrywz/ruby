Rails.application.routes.draw do
  get 'help/index' => 'help#index'
  resources :help do

  end

  resources :transaction_orders do
    collection do
      # get 'pay'
      post 'do_pay'
      post 'do_deliver'
      post 'do_receive'
    end
  end
  resources :transaction_items
  resources :favorites
  resources :carts
  resources :albums
  resources :musicians
  resources :genres
  resources :regions
  resources :users do
    collection do
      get 'login'
      post 'do_login'
      get 'logout'
    end
    # resources :transaction_orders
  end
  root :to => 'albums#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
