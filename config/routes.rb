FriendCircle::Application.routes.draw do
  resources :users do
    resources :circle_circles, only: [:index, :new, :create, :destroy]
    resources :posts, only: [:index, :new, :create, :destroy]
  end
  resource :session, :only => [:new, :create, :destroy]

  resources :circle_circles, :only => [:show, :edit, :update]
  resources :posts, only: :show
  get '/feed' => 'posts#index'
end
