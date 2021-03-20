Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :clients, only: [ :index ]

      resources :clients, only: [:show] do
        resources :payment_transactions, only: [:index]
      end
     get "/admin/seed", to: "admin#seed", as: :seed
     get "/admin/reset", to: "admin#reset", as: :reset
    end
  end
end
