Rails.application.routes.draw do
  get "users/index"
  get "users/show"
  resources :posts do
    collection do
      get :likes
    end
  end
  resources :likes, only: %i[create destroy]
  devise_for :users
  root "static_pages#top"
  get "pages/show"
  resources :users, only: %i[ index show destroy ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  # ログアウトエラー対処用
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
end
