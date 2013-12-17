Coachvantage::Application.routes.draw do
  mount StripeEvent::Engine => '/stripe'

  authenticated :user do
    root :to => 'dashboard#index'
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
  resources :contact
  resources :schedule
  resources :report
end