Rails.application.routes.draw do
  get 'csv/exportaMovimentacao'
  get 'movimentacaos/create_by_csv'
  get 'movimentacaos/total_armazenado'
  post 'movimentacaos/create_by_csv'
  resources :movimentacaos
  resources :armazenamentos
  resources :produtos
  get 'welcome/index'
  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
