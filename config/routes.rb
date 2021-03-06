Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'newspapers#index'
  Rails.application.routes.draw do
    resources :newspapers
    
    get 'category', to: 'category#index'
    get 'newspapers/show_by_cat/:id', to: 'newspapers#show_by_cat'
    get '/feedrss', to:'newspapers#feed_rss', :defaults => { :format => 'atom' }

    namespace :users do 
     get 'rolify', to: 'rolify#index'
     put 'rolify/add_role_to_user', to: 'rolify#role_to_user', as: 'add_role_to_user'
     delete 'remove_role_to_user/:user_name/:role_name', to: 'rolify#remove_role_to_user_button'
    end
    
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end

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