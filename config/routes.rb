Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'pages#index'
  get 'eventos/:id', to: 'pages#show', as: :event
  get 'mis-tickets', to: 'tickets#index', as: :tickets
  get 'ticket/:id', to: 'tickets#show', as: :ticket
  post 'ticket/:event_id', to: 'tickets#create_ticket', as: :create_ticket


end
