Rails.application.routes.draw do
  get 'csv/exportaMovimentacao'
  resources :movimentacaos
  resources :armazenamentos
  resources :produtos
  get 'welcome/index'
  get 'movimentacaos/export_csv'
  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
