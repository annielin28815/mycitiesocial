Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'products#index'


  namespace :admin do
    root 'products#index'
    resources :products, except: [:show]
    resources :vendors, except: [:show]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
