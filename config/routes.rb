Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  root to: 'homes#top'
  # 画像の投稿のルーティング(親要素）と画像にコメントをする機能（子要素）のルート
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    #いいね機能のルートこちらもネストしている
    resources :favorites, only: [:create, :destroy]
    # ネストをしている
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
