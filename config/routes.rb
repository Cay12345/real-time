Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  root "home#index"

  resources :chats, only: [:create, :show]
  resources :messages, only: :create
end
