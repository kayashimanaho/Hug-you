Rails.application.routes.draw do
  namespace :public do
    get 'notifications/index'
  end
 # 顧客用
# URL /users/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
 }
 
 scope module: :public do
      root to:"homes#top"
      get "/about" => "homes#about", as: "about"
      # resources :items, only:[:index, :show]
      resources :users, only: [:index, :create, :show] do
        collection do
          get 'my_page'
          get 'information/edit', action: :edit
          patch 'information',action: :update
          get 'unsubscribe' 
          patch 'withdraw' 
      end
    end
        #メッセージ通知
        resources :notifications, only: [:index, :update]
        # メッセージ機能
        resources :messages, only: [:create, :index]
        resources :rooms, only: [:create, :index, :show]
      
      resources :posts, only: [:index, :show, :edit, :update, :create, :destroy] do
        resources :comments, only: [:edit, :update, :create, :destroy]
        resource :favorites, only: [:create, :destroy]
      end
      #resources :comments, only: [:destroy]
      resources :cart_items, only:[:index, :update, :destroy, :create] do
        collection do
          delete 'destroy_all',action: :destroy_all
        end
      end
      resources :orders, only:[:new, :create, :index, :show] do
        collection do
          post 'comfirm'
          get 'complete'
        end
      end
        
      end
      
      resources :addresses, only:[:index, :edit, :create, :update, :destroy]
   
   
   namespace :admin do
    root to:"homes#top"
    resources :order_details,only:[:update]
    resources :orders, only:[:show, :index, :update]
    resources :users, only:[:show, :edit, :update]
    resources :posts,only:[:index, :show, :edit, :update, :destroy]
    resources :comments,only:[:index, :show, :edit, :update, :destroy]
    resources :keywords,only:[:index, :show, :edit, :update, :destroy]
  end

end
