Coachvantage::Application.routes.draw do
  mount StripeEvent::Engine => '/stripe'

  authenticated :user do
    root :to => 'dashboards#index'
  end
  root :to => "home#index"

  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'update_plan', :to => 'registrations#update_plan'
    put 'update_card', :to => 'registrations#update_card'
  end

  resources :users do
    collection do
      get :settings
    end

    member do
      put :update_setting
    end
  end
  resources :dashboards
  resources :coachinglogs
  resources :documents
  resources :invoices
  resources :contacts do
    member do
      put :update_contact_info
      post :add_doc
      post :add_sessionlog
    end
    collection do
      get :index_by_type
    end
    scope module: 'contacts' do
      resources :notes
      resources :details
      resources :sessions
      resources :invoices
      resources :contracts
    end
  end
  resources :schedules
  resources :reports
end