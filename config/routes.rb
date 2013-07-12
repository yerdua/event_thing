Project2::Application.routes.draw do
  scope 'api', defaults: { format: :json } do
    resources :users, only: [:index, :show, :update] do
      resources :events, only: [:index]
    end
    resources :events
    resources :tags, only: [:create, :destroy, :index]
    
    resources :venues do
      resources :events, only: [:index]
    end
  end
  
  root to: "root#root"
  
  resource :session, only: [:create, :destroy, :new]
  resources :users do
    resources :events, only: [:index]
  end
  resources :events, only: [:index]
  resources :venues do
    resources :events, only: [:index]
  end
end
