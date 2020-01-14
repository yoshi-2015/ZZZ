Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ネスト(入れ子)した形に変更 + フォロー一覧、フォロワー一覧の画面も用意
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :memos do
    collection do
    post :confirm
    # post :new, path: :new, as: :new, action: :back
  end
    resources :memo_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  get 'searchs/search' => 'searchs#search', as: :search

  resources :homes, only: [:top ,:show]
  root to: 'homes#top'
  get '/home/about' => 'homes#show', as: :about
  resources :maps, only: [:create, :index, :show, :edit, :create, :destroy]
end
