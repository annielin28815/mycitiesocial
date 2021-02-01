Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'products#index'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]




  namespace :admin do
    root 'products#index'
    resources :products, except: [:show]
    resources :vendors, except: [:show]
    resources :categories, except: [:show] do
      collection do
        put :sort # 使用PUT的方法，做出/admin/categories/sort路徑
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do
      post 'subscribe', to: 'utils#subscribe'
    end
  end
  # POST /api/v1/subscribe(用POST的方法去接，而因為設計api時有可能會面臨改版，v1、v2是版本的東西，建議可以加。)
  # POST /api/v2/subscribe



end
