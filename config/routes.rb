Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      # Define my API routes here
    end
  end
  # Add a catch-all route to handle routing on the frontend
  get '*path', to: 'application#index', via: :all
end
