Invasion::Application.routes.draw do
 get "account" => "users#show", :as => "account"
 get "logout" => "sessions#destroy", :as => "logout"
 get "login" => "sessions#new", :as => "login"
 get "signup" => "users#new", :as => "signup"
 get "dashboard" => "home#dashboard", :as => "dashboard"
 resources :users
 resources :sessions
 root :to => "home#index" 
end
