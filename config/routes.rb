Rails.application.routes.draw do
  resources :exercises
  devise_for :users

  root to: 'pages#home'
  
  # Mailchimp integration
  post '/adduser', to: 'newsletters#addUser'
  put '/removeuser', to: 'newsletters#removeUser'

  # Workouts
  resources :workouts do
    member do
      post :edit
      put :toggle_public
    end
    
    # Exercises within block
    resources :blocks, except: [:index, :show] do
      resources :exercise_instances, except: [:index, :show]
    end
  
  end

  # Drag to new position for block
  resource :block_position, only: [:update]
  
  # Drag to new position for exercise_instance
  resource :exercise_instance_position, only: [:update]

  # Update repetitions
  resource :repetitions, only: [:update]
  
end
