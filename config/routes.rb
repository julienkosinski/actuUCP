Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'newspapers#index'
  Rails.application.routes.draw do
    resources :newspapers

    get 'category', to: 'category#index'
    get 'newspapers/show_by_cat/:id', to: 'newspapers#show_by_cat'
    
    # Create the CRUD for editing and creating new roles could be useful if we can define the new role to be an infant of association or admin. It could allow to create dynamically new roles like new type of association and so on. Anyway, by default it doesn't distirb ourselves for the time being.

    namespace :users do 
      resources :rolify do 
        collection do
         get 'add_role_to_user'
         get 'remove_role_to_user'
         put 'update_role_to_user/:add_or_remove/:user_id/:role_id', to: 'rolify#update_role_to_user'
        end
      end
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