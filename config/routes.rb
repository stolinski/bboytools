Sets::Application.routes.draw do
  resources :blogs


  resources :user_battles
  resources :round_moves
  resources :battles


  resources :rounds do
    collection { post :sort }
  end


  get "profiles/show"

  resources :moves
  resources :types

  devise_for :users
  devise_scope :user do
    get "register", to: "devise/registrations#new", as: :register
    get "signin", to: "devise/sessions#new", as: :signin
    get "signout", to: "devise/sessions#destroy", as: :signout
  end

  get '/blog', to: 'blogs#index'

  get '/time', to: 'profiles#time', as: :time
  get '/battle-mode', to: 'profiles#bmode', as: :bmode
  get '/move-call-out', to: 'profiles#callout', as: :callout
  get '/round-gen/:rounds', to: 'profiles#roundgen', as: :roundgen
  get '/users', to: 'profiles#users', as: :users
  get '/:id', to: 'profiles#show', as: :userpage

  # The priority is based upon order of creation:
  # first created -> highest priority.
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  authenticated :user do
    root :to => "moves#index"
  end

  root :to => 'profiles#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
