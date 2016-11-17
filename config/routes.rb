Rails.application.routes.draw do

  get 'accounting_years/index'

  get 'gallery/index'

  resources :budget_room_details
  resources :budget_service_details
  resources :cleanings
  resources :invoice_details
  resources :account_details
  resources :reservations
  resources :cleaning_rooms
  resources :photos
  resources :employees do
    get :autocomplete_employee_cedula, :on => :collection
  end

  resources :rooms do
    get :autocomplete_room_identificador, :on => :collection
  end
  resources :budgets do
  collection do
      get 'my_new'
    end
  end
  
  resources :accounting_entries
  resources :detail_of_payment_types
  resources :payment_types
  resources :detail_of_cash_movements
  resources :detail_of_cash_counts
  resources :cash_movements do
  collection do
      get 'my_new'
    end
  end
  
  resources :type_of_cash_movements
  resources :cash_counts
  resources :closing_cashes
  resources :opening_cashes do
  collection do
      get 'my_new'
    end
  end

  resources :cashes
  resources :type_of_rooms do
     get :autocomplete_type_of_room_tipo, :on => :collection
  end

  resources :accounting_entries
  resources :accounting_accounts
  resources :account_plans
  resources :accounting_years
  get 'balance_report/balance'
  get 'ledger/mayor'
  get 'diary_book/diario'
  post 'diary_book/diario'

  resources :reservation_requests
  resources :services do
    get :autocomplete_service_nombre, :on => :collection
  end  
  resources :accounts
  resources :invoices
  resources :clients do 
    get :autocomplete_client_cedula, :on => :collection
  end
  devise_for :users
  resources :complaints do
    collection do
      get 'my_new'
    end
    get :autocomplete_complaint_service_description, :on => :collection
  end  
  get 'reports/index'
  get 'dashboard/index'
  get 'welcome/index'

  resources :usuarios
  match 'usuarios/:id' => 'usuarios#destroy', :via => :delete, :as => :admin_destroy_user

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
