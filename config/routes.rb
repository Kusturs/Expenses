Rails.application.routes.draw do
  resource :sessions, only: %i[new create destroy]

  resources :users, only: %i[new create]

  resources :payments do
    resources :comments
  end

  root "pages#index"
end
