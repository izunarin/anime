Rails.application.routes.draw do

  root to: "public/items#index"

  namespace :admin do
    patch 'customers/withdraw' => "customers#withdraw"
    resources :customers, only: :index
    resources :items, only: [:new, :index, :create, :show, :edit, :update] do
      resources :comments, only: :destroy
    end
  end

  namespace :public do
    resources :likes, only: [:index, :create, :destroy]
    resources :items, only: [:show] do
      resources :comments, only: [:create, :destroy]
    end
  end

  devise_scope :customer do
     post '/customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  end

  devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
