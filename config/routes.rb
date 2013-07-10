Project2::Application.routes.draw do
  scope 'api', defaults: { format: :json } do
    resources :users, only: [:index, :show] do
      resources :events, only: [:index]
    end
    resources :events
  end
  
  root to: "root#root"
  
  resource :session, only: [:create, :destroy, :new]
  resources :users do
    resources :events, only: [:index]
  end
  resources :events
end
