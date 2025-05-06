Rails.application.routes.draw do
  # resources :contacts
  resources :following_users
  resources :followers
  resources :bulletins
  resources :categories
  get "contact/index"
  match "contact/new", to: "contact#new", via: [ :get ]
  post "/submit_contact_form", to: "contact#create"
  resource :session
  resources :users
  resources :passwords, param: :token
  resources :posts do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  match "follow_user", to: "users#follow_user", via: [ :post ]
  # Defines the root path route ("/")
  root "posts#index"
end
