Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace :api do
    namespace :v1 do
      post '/user_sign_in' => 'user_before_signin#sign_in'
      post '/user_sign_up' => 'user_before_signin#sign_up'
      post '/admin_sign_in' => 'admin_before_signin#sign_in'
      post '/admin_sign_up' => 'admin_before_signin#sign_up'

      get '/all_users' => 'admin_after_signin#all_users'
      get '/admin_products' => 'admin_after_signin#admin_products'
      get '/admin_products_and_reviews' => 'admin_after_signin#products_and_reviews'
      get '/all_products' => 'user_after_signin#all_products'
      get '/user_products_and_reviews' => 'user_after_signin#products_and_reviews'
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
