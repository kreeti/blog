# coding: utf-8
Rails.application.routes.draw do
  resources :posts do
  	resources :comments
  end

  resources :users
  resources :home, only: [:show]

  resources :sessions, only: [:new, :create, :destroy]
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"

  root "home#show"
end
