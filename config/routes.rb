Rails.application.routes.draw do
  resources :exercises
  devise_for :users
  root to: 'pages#home'
  resources :sessions do
    resources :blocks
  end

end
