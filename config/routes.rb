Qp::Application.routes.draw do

  get "districts/index"
  root "coupons#index"

  devise_for :admins
  devise_for :users
  devise_for :brands

  #Category
  get 'categories/index' => "categories#index", as: :categories_index
  get 'categories/show/:id' => "categories#show", as: :category_show
  post 'categories/create' => "categories#create", as: :category_create
  post 'categories/update' => "categories#update", as: :category_update
  get 'categories/destroy/:id' => "categories#destroy", as: :category_destroy

  #Subcategory
  post 'sub_categories/create' => "sub_categories#create", as: :sub_categories_create
  post 'sub_categories/update' => "sub_categories#update", as: :sub_categories_update
  get 'sub_categories/destroy/:id' => "sub_categories#destroy", as: :sub_categories_destroy

  #City
  get "cities/index" => "cities#index", as: :cities_index
  get 'cities/show/:id' => "cities#show", as: :cities_show
  post 'cities/create' => "cities#create", as: :cities_create
  post 'cities/update' => "cities#update", as: :cities_update
  get 'cities/destroy/:id' => "cities#destroy", as: :cities_destroy

  #District
  post 'districts/create' => "districts#create", as: :districts_create
  post 'districts/update' => "districts#update", as: :districts_update
  get 'districts/destroy/:id' => "districts#destroy", as: :districts_destroy

  #Coupons
  get 'coupons/history' => "coupons#history", as: :coupons_history
  get 'coupons/saved_coupons/:id' => "coupons#saved_coupons", as: :saved_coupons
  resources :coupons

  #Branches
  get "branches/index/:id" => "branches#index", as: :branches_index
  post "branches/create" => "branches#create", as: :create_branch

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
