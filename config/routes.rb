Rails.application.routes.draw do

  root   'home#index'
  get    'edit'    => 'home#edit'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'projects/new/:id'  => 'projects#new_one'
  get   'signup'  => 'registration#signup'
  resources :profiles , only: [:new, :create, :update, :show]
  resources :educations , only: [:new]
  resources :experiences , only: [:new, :create, :update]
  resources :projects , only: [:new, :create, :update, :new_one]
  resources :users , only: [:new, :create, :show]
end
