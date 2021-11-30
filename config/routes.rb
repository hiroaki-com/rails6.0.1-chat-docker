Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ActionCable.server => '/cable'
 
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  root 'rooms#show'
  # 次の一行を追加
  resources :messages, only: :create
  get '/show_additionally', to: 'rooms#show_additionally'

  # ゲストログインユーザー機能実装のため記述
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

end
