Coachvantage::Application.routes.draw do
  get "client/index"

  get "client/new"

  get "client/edit"

  get "client/show"

  get "invoice/edit"

  get "invoice/show"

  get "invoice/index"

  get "invoice/new"

  get "document/index"

  get "coachinglog/index"

  get "coachinglog/new"

  get "coachinglog/edit"

  get "dashboard/index"

  mount StripeEvent::Engine => '/stripe'
  get "content/gold"
  get "content/silver"
  get "content/platinum"
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'update_plan', :to => 'registrations#update_plan'
    put 'update_card', :to => 'registrations#update_card'
  end
  resources :users
  resources :dashboard
  resources :coachinglog
  resources :document
  resources :invoice
  resources :client
end