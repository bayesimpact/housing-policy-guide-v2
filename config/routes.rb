Rails.application.routes.draw do
  devise_for :admins

  devise_scope :admin do
    get "/login", to: "devise/sessions#new"
  end

  get '/about', to: 'welcome#about'
  get '/data', to: 'datasets#index'

  resources :datasets, only: [:index, :show]
  resources :policies, only: [:index, :show]

  namespace :admin do
    resources :datasets, :policies, :data_groups, :action_links
  end

  root 'welcome#home'
end
