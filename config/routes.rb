Rails.application.routes.draw do
   get "/top"=> "home#top"
  root 'home#top'
  get 'home/about' => 'home#about'
  devise_for :users
  resources :users, only: [:show, :index, :edit, :update] do
  resource :relationships, only: [:create, :destroy]
      get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
end
get '/search', to: 'search#search'
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

end