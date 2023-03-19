Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, only: [:index]
        resources :ratings, only: [:create, :index]
    end
  end
end
