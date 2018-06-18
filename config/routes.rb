Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles

  root 'articles#index'

  resources :feedbacks, only: [:new]

  namespace :api do
    resource :feedbacks, only: [:create]
  end
end
