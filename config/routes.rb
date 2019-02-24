Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :dogs, only: [:index, :create]

      get "dogs/search", to: "search#index"
    end
  end
end
