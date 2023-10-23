Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  
  # SIDEKIQ
  require "sidekiq/web"

  # WORKER (Github Cronjob)
  get "/start_clearing_lonely_workouts", to: "worker#start_clearing_lonely_workouts"
  
  # EXERCISES
  resources :exercises do
    resources :exercise_categories, only: [:new, :create, :destroy]
  end
  
  # USERS
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }  
  resources :users, only: [:index, :show]

  # ADMIN
  authenticate :user, ->(user) { user.admin? } do  
    mount Sidekiq::Web => '/sidekiq'
    scope module: :admin do
      resources :analytics, only: [:index]
    end
  end
    
  # PUBLIC PAGES
  root to: 'pages#home'
  get '/home_modal', to: 'pages#home_modal'
  get '/about', to: 'pages#about'
  
  # Mailchimp integration
  post '/adduser', to: 'newsletters#addUser'
  put '/removeuser', to: 'newsletters#removeUser'

  # CONTACTS
  resources :contacts, only: [:index, :new, :create, :show, :destroy]

  # BLOG POSTS
  resources :posts do
    member do
      patch :publish
    end
  end

  # WORKOUTS
  get 'my_workouts' => 'workouts#user_workouts', as: :user_workouts
  get 'public_workouts' => 'workouts#public_workouts', as: :public_workouts

  resources :workouts do
    # Additional actions for workouts
    member do
      post :edit
      get :save_workout
      put :toggle_public
    end
    # Broadcasting authorizations
    scope module: :workouts do
      resource :actions, only: :show
    end
    
    # Exercises within block
    resources :blocks, except: [:index, :show] do
      member do
        post :edit
        post :edit_title
      end
      resources :exercise_instances, except: [:index, :show] 
      resources :exercise_exercise_instances, only: [:new, :create]
    end
  end

  # Drag to new position for block
  resource :block_position, only: [:update]
  
  # Drag to new position for exercise_instance
  resource :exercise_instance_position, only: [:update]

  # Update repetitions
  resource :repetitions, only: [:update]
  
  # Manage file uploads
  resources :file_uploads, only: [:destroy]

  # Destroy Async Exercise Categories
  resource :exercise_categories, only: [:destroy]
end
