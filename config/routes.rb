Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'rooms#show'
  # 次の一行を追加
  resources :messages, only: :create
end
