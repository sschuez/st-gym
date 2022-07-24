Rails.application.routes.draw do
  resources :exercises
  devise_for :users
  root to: 'pages#home'
  
  # Sessions
  resources :sessions do
    
    # Exercises within block
    resources :blocks do
      resources :exercise_instances
    end
  
  end

end
