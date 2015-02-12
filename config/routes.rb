Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'sessions#index'

  get 'user/:id', to: 'users#show', as: 'home'

  get 'conditions', to: 'conditions#index', as: :conditions_index
  get 'conditions/:id', to: 'conditions#show', as: 'condition'
  
  get 'user/:id/calendar', to: 'calendar#show', as: :calendar
  get 'user/:id/calendar/events', to: 'calendar#events_calendar', as: :events_calendar

  get '/actions', to: 'actionables#index' 

  post 'articles/create' => 'articles#create', as: :create_article
  post 'actionables/create' => 'actionables#create', as: :create_actionable
  post 'conditions/create' => 'conditions#create', as: :create_condition
  post 'recurring_events/create' => 'recurring_events#create', as: :create_recurring_event
  post 'feelings/create' => 'feelings#create', as: :create_feeling
  post 'check_ins/create' => 'check_ins#create', as: :create_check_in

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
