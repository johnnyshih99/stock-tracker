Rails.application.routes.draw do
  get 'transactions/destroy'
  root "portfolios#index"
  
  resources :portfolios do
    post '/create_stock', to: 'portfolios#create_stock'
    post '/create_transaction/:stock_id', to: 'portfolios#create_transaction'
    resources :stocks, only: [:destroy]
    resources :transactions, only: [:destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
