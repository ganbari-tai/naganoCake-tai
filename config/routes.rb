Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
}
  
  
  
  namespace :admin do
    root to: "homes#top"  
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    get "/search" => "items#search"
  end
  
  
  scope module: :public do
    root to: "homes#top"
    get '/about' => "homes#about", as: 'about'
    resources :items, only: [:index, :show]
    get "customers/my_page" => "customers#show"
    get "customers/infomation/edit" => "customers#edit"
    patch "customers/infomation" => "customers#update"
    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :orders, only: [:new, :create, :index, :show]
    post "orders/confirm" => "orders#confirm"
    get 'orders/thanks'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    get "/search" => "items#search"
  end
  
    # get 'cart_items/destroy_all'

    # get 'customers/unsubscribe'
    # get 'customers/withdraw'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
