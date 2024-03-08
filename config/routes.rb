Rails.application.routes.draw do
  get 'questions/index'
  get 'questions/new'
  get 'questions/edit'
  get 'questions/show'
  get '/login'=>"sessions#new"
  post '/login'=>"sessions#create", as: 'logedin'
  get '/logout'=>"sessions#destroy", as: 'logout'
  # get 'student/new'
  # get 'student/show'
  # get 'student/edit'
  root 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :students, only: [:new,:edit, :create, :index, :show]
  resources :exams do
    resources :questions do
      resources :options
    end
  end
  resources :questions
  resources :options
  resources :sessions, only: [:new, :create, :destroy]
end
