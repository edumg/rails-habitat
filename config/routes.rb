Rails.application.routes.draw do

  get 'errors/not_found'

  get 'errors/internal_server_error'

  ActiveAdmin.routes(self)
  resource :profile, only: [:show, :edit, :update] do
  end

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

 # resources :personality_storages

 resources :personality

 root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users'}

    get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
    get "mailbox/sent"  => "mailbox#sent",  as: :mailbox_sent
    get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash
    get "mailbox/mark_as_read" => "mailbox#mark_as_read", as: :mark_as_read

    resources :conversations do
      member do
        post :reply
        post :trash
        post :untrash
        post :mark_as_read
      end
    end

    resources :listings do
      resources :bookings, only: [:new, :create, :show, :delete]
      resources :questionnaire
    end

    resources :bookings

    resources :conversations

    resources :orders, only: [:show, :create] do
      resources :payments, only: [:new, :create]
    end

  end
