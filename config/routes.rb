Rails.application.routes.draw do
  devise_for :users
  resources :users

  root to: 'pages#index'
  get 'eventos/:id', to: 'events#show', as: :event
  get 'mis-tickets', to: 'tickets#index', as: :tickets
  get 'mis-eventos', to: 'events#index', as: :my_events
  get 'editar-evento/:id', to: 'events#edit', as: :edit_event
  patch 'editar-evento-publicar/:id', to: 'events#update', as: :update_event
  get 'evento-privado/:auth_token', to: 'events#private_show', as: :private_event

  get 'nuevo-evento', to: 'events#new', as: :new_event
  post 'nuevo-evento-publicar', to: 'events#create', as: :create_event
  get 'ticket/:id', to: 'tickets#show', as: :ticket
  post 'ticket/:event_id', to: 'tickets#create_ticket', as: :create_ticket

  delete 'borrar-evento/:auth_token', to: 'events#destroy', as: :delete_event
  devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)


end
