Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :scenarios do
    collection do
      get 'use'
    end
  end
  resources :scenarios, only: [:show, :create, :use]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
