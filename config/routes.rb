Qp::Application.routes.draw do

  root "coupons#index"

  devise_for :admins
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" } 

  #Brand
  get "brands/index" => "brands#index", as: :brands_index
  devise_for :brands, controllers: { registrations: "brands/registrations", sessions: "brands/sessions" }, path_prefix: "my"
  resources :brands

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
  post 'cities/search_districts_for_city' => "cities#search_districts_for_city", as: :search_districts_for_city

  #District
  post 'districts/create' => "districts#create", as: :districts_create
  post 'districts/update' => "districts#update", as: :districts_update
  get 'districts/destroy/:id' => "districts#destroy", as: :districts_destroy

  #Coupons
  get 'coupons/history' => "coupons#history", as: :coupons_history
  get 'coupons/published_coupons/:id' => "coupons#published_coupons", as: :coupons_published
  get 'coupons/saved_coupons/:id' => "coupons#saved_coupons", as: :saved_coupons
  get 'coupons/pending_coupons/:id' => "coupons#pending_coupons_by_brand", as: :pending_coupons_by_brand
  get 'coupons/pending_coupons' => "coupons#pending_coupons", as: :pending_coupons
  post 'coupons/approve_coupon/:id' => "coupons#approve_coupon", as: :approve_coupon
  resources :coupons

  #Coupon States
  get "coupon_states/index" => "coupon_states#index", as: :coupon_states_index
  post "coupon_states/create" => "coupon_states#create", as: :coupon_states_create
  get "coupon_states/destroy/:id" => "coupon_states#destroy", as: :coupon_states_destroy
  post "coupon_states/update" => "coupon_states#update", as: :coupon_states_update

  #Coupon Types
  get "coupon_types/index" => "coupon_types#index", as: :coupon_types_index
  post "coupon_types/create" => "coupon_types#create", as: :coupon_types_create
  get "coupon_types/destroy/:id" => "coupon_types#destroy", as: :coupon_types_destroy
  post "coupon_types/update" => "coupon_types#update", as: :coupon_types_update

  #Branches
  get "branches/index/:id" => "branches#index", as: :branches_index
  post "branches/create" => "branches#create", as: :create_branch
  get "branches/destroy/:id" => "branches#destroy", as: :destroy_branch
  post "branches/edit" => "branches#edit", as: :edit_branch
  post "branches/grouped_branches" => "branches#grouped_branches", as: :grouped_branches
  post "branches/branches_in_district" => "branches#branches_in_district"

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
