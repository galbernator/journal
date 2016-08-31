Rails.application.routes.draw do

  resources :users, except: [:index] do
    resources :entries, only: [:index, :new, :show, :destroy]
  end
  resources :categories, excpet: [:show]
  resources :questions

  resources :sessions, only: [:create]
  delete :logout, to: 'sessions#destroy', as: 'logout'
  get :login, to: 'sessions#new', as: 'login'
  post :login, to: 'sessions#create'

  root 'entries#index'

end
