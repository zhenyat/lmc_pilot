Rails.application.routes.draw do

  resources :items
  resources :assessments
  resources :sessions, only: [:new, :create, :destroy]

  get 'datashow/behavior'

  get 'pages/help'
  get 'pages/home'
  get 'pages/review'

  delete 'signout', to: 'sessions#destroy', as: :signout

  namespace :admin do
    resources :actioncards
    resources :behaviors
    resources :clusters
    resources :competencies
    resources :departments
    resources :employees
    resources :levels
    resources :panel #  OK
#   get       'panel/index' - NOT OK
    resources :positions
    resources :roles
    resources :stores
    resources :users

    post 'set_values_for_actioncard', to: 'actioncards',  as: 'set_values_for_actioncard'
    post 'set_values',                to: 'behaviors',    as: 'set_values'
    post 'set_cluster',               to: 'competencies', as: 'set_cluster'
    post 'set_position',              to: 'competencies', as: 'set_position'
  end

  get  'final_form',   to: 'assessments', as: 'final_form'
  get  'reports',      to: 'assessments', as: 'reports'
  get  'report_user',  to: 'assessments', as: 'report_user'
  post 'set_user',     to: 'assessments', as: 'set_user'
  post 'handle_edit',  to: 'assessments', as: 'assessments/handle_edit'
  post 'handle_final', to: 'assessments', as: 'handle_final'
  post 'handle_new',   to: 'assessments', as: 'handle_new'
  post 'handle_update', to: 'items', as: 'handle_update'
  post 'review',       to: 'pages',       as: 'review'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'sessions#new'

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
