MentorMatch::Application.routes.draw do
  devise_for :users

  resources :students do
    resources :rankings
  end
  resources :mentors do
    resources :studentrankings
  end
  resources :home
  resources :notifications

  root :to => 'home#index'

  namespace :admin do
    root :to => "users#index"
    resources :users
  end

  #This is sent to both mentors and students when they are paired
  match '/thanks' => "students#thanks"

  match '/rankings' => "mentors#rankings"

  match '/studentrankings' => "students#rankings"

  #This is used by the admin to pair students
  match '/paired' => "admin::users#paired"
  match '/pair' => "admin::users#pair"

  match "/rank" => "rankings#update_ranks", as: :update_ranks
  match "/studentrank" => "studentrankings#update_ranks", as: :update_studentranks
  match "/pending" => "admin::users#pending_users", as: :pending_users
  match "/approve" => "admin::users#approve"
  match "/needsapproval" => "home#need_approval"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
