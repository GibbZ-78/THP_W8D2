Rails.application.routes.draw do
  
  devise_for :users
  # Setting up the "root" page of the web site (i.e. home / landing page)
  root to: "static_pages#index"

  # Specific routing for several pages, including home page (index)
  get 'static_pages/index', to: "static_pages#index"
  get 'static_pages/contact', to: "static_pages#contact"
  get 'static_pages/team', to: "static_pages#team"
  get 'static_pages/secret', to: "static_pages#secret"

  # Automated routing for Attendances and Events
  resources :attendances
  resources :events
  
  # Additional specific routes
  get 'events/my_events', to: "events#mine", as: "my_events"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
