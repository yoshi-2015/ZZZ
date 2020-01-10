Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root 'users#show'
  resources :users
  resources :memos do
    collection do
    post :confirm
    # post :new, path: :new, as: :new, action: :back
  end
    resource :memo_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end



  resources :homes, only: [:top ,:show]
  root to: 'homes#top'
  get '/home/about' => 'homes#show', as: :about
end




