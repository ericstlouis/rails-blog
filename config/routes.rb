Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # routes
  #
  resources :blogposts

  # get "/blogpost/new", to: "blogpost#new", as: :new_blogpost

  # get "/blogpost/:id", to: "blogpost#show", as: :blogpost

  # patch "/blogpost/:id", to: "blogpost#update"

  # delete "/blogpost/:id", to: "blogpost#destroy"

  # get "/blogpost/:id/edit", to: "blogpost#edit", as: :edit_blogpost

  # post "/blogpost", to: "blogpost#create", as: :blogposts

  # Defines the root path route ("/")
  root "blogposts#index"
end
