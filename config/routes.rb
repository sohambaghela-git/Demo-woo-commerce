Rails.application.routes.draw do
  root "welcome#welcome"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  resources :users do
    resources :products do
      resources :orders 
    end
  end
end
