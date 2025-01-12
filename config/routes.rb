Rails.application.routes.draw do
  # Q15 route.
  # get "/products", to: "products#index"

  # Q17 rewrite of routes.
  resources :products, only: [:index, :show]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
