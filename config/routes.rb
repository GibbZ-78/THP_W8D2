Rails.application.routes.draw do
  get 'static_pages/index'
  get 'static_pages/contact'
  get 'static_pages/team'
  get 'static_pages/secret'
  resources :attendances
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
