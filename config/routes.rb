Rails.application.routes.draw do

  resource :profile, only: [:show, :edit, :update]

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users'}

end
