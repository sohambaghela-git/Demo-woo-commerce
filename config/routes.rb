Rails.application.routes.draw do
   root "welcome#welcome"

   post "/users/show", to: "users#show"
   post "/users/login", to: "users#login"
   resources :users do
      resources :posts
   end
end
