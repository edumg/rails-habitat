Rails.application.routes.draw do

  get 'listings/new'

  get 'listings/create'

  get 'listings/index'

  get 'listings/show'

  get 'listings/detroy'

  get 'listings/update'

  get 'listings/edit'

  get 'bookings/new'

  get 'bookings/create'

  get 'bookings/show'

  get 'bookings/delete'

  resource :profile, only: [:show, :edit, :update]

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
  end

  resources :bookings

  resources :conversations
end
