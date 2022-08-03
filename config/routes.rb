Rails.application.routes.draw do
  resources :exercises
  devise_for :users
  root to: 'pages#home'
  
  # Mailchimp integration
  post '/adduser', to: 'newsletters#addUser'
  put '/removeuser', to: 'newsletters#removeUser'

  # Sessions
  resources :sessions do
    member do
      post :edit
    end
    
    # Exercises within block
    resources :blocks, except: [:index, :show] do
      resources :exercise_instances, except: [:index, :show]
    end
  
  end

  # Drag to new position for block
  resource :block_position, only: [:update]
  
end
