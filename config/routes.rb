Rails.application.routes.draw do
  
  root to: "public/items#index"
  
  namespace :admin do
    resources :comments, only: [:index, :destroy]
    patch 'customers/withdraw' => "customers#withdraw"
    resources :customers, only: [:index]
    resources :items, only: [:new, :index, :create, :show, :edit, :update]
  end

  namespace :public do
    resources :comments, only: [:create]
    resources :likes, only: [:index, :create, :destroy]
    resources :items, only: [:show]
  end
 
   post '/homes/guest_sign_in', to: 'homes#new_guest'

  devise_for :customers,skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
