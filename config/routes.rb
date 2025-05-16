

Rails.application.routes.draw do
  get "reservations", to: "reservations#new"
  get "pages/index"
  get "home/index"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA support
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Page d'accueil
  root "pages#home"

  # Réservations
  resources :reservations, only: [:new, :create, :index]

  # Espace admin
  namespace :admin do
    resources :reservations, only: [:index, :show, :destroy]
  end

  # Connexion admin
  get "/admin/login", to: "admin/sessions#new", as: :admin_login
  post "/admin/login", to: "admin/sessions#create"
  delete "/admin/logout", to: "admin/sessions#destroy", as: :admin_logout
end
