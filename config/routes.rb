Rails.application.routes.draw do
  
  # Setting up the "root" page of the web site (i.e. home / landing page)
  root to: "static_pages#index"

  # Auto-generated routes by DEVISE
  devise_for :users  

  # Specific routing for several pages, including home page (index)
  get 'static_pages/index', to: "static_pages#index"
  get 'static_pages/contact', to: "static_pages#contact"
  get 'static_pages/team', to: "static_pages#team"
  get 'static_pages/secret', to: "static_pages#secret"
  get 'static_pages/mycss', to: "static_pages#mycss"

  # Additional specific routes
  get 'events/my_events/', to: "events#mine", as: "my_events"

  # Automated routing for Attendances and Events
  resources :attendances
  resources :events
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
