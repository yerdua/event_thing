Project2::Application.routes.draw do
  root to: "root#root"
  
  resource :session, only: [:create, :destroy, :new]
  resources :users
end
