Rails.application.routes.draw do
  resources :exercises
  devise_for :users
  root to: 'pages#home'
  
  # Sessions
  resources :sessions do
    
    resources :session_instances do
      
      # Exercises within block
      resources :blocks do
        resources :exercise_instances
      end
      
      # Exercises within session / no blocks
      resources :exercise_instances
      
    end
  end

end
