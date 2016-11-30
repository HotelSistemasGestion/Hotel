Rails.application.routes.draw do


  get 'accounting_report/mayor'

  get 'accounting_report/balance'

  get 'accounting_years/index'

  get 'audit/index'
  get 'audit/:id', to: 'audit#show', as: 'audit_change'

  resources :reservation_rooms

  get 'picture/index'

  get 'notificacion/index'


  get 'gallery/index'

 
  resources :budget_room_details
  resources :budget_service_details
  resources :cleanings do
    collection do
      get 'report'
    end
  end
  resources :invoice_details
  resources :account_details do
    collection do
      get 'report'
    end
  end
  resources :reservations  do
    collection do
      get 'habitaciones'
    end
    collection do
      get 'hay_disponible'
    end
    collection do
        get 'my_new'
    end
  end
  resources :cleaning_rooms
  resources :photos  
  resources :rols 
  resources :employees do
    get :autocomplete_employee_cedula, :on => :collection
  end

  resources :rooms do
    collection do
      get 'report'
    end
    get :autocomplete_room_identificador, :on => :collection 
  end

  resources :budgets do
    collection do
        get 'my_new'
    end
    collection do
        get 'hay_disponible'
    end
    collection do
        get 'disponibles'
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
    resources :cash_movements, :except => [:show, :destroy] do 
      collection do
        get 'new'
      end
    end
    collection do
      get 'my_new'
    end

  end 

  get "client_invoices/:client_id" => "cash_movements#client_invoices"

  get "list/:opening_cash_id" => "cash_movements#list",as: "list"

  get "montos_cierre/:opening_cash_id" => "closing_cashes#montos_cierre"

  get "accountiong_account_years/:accounting_year_id" => "accounting_accounts#accountiong_account_years"

  resources :cashes
  resources :type_of_rooms do
     get :autocomplete_type_of_room_tipo, :on => :collection
  end
  
  resources :accounting_entries
  resources :accounting_accounts
  resources :account_plans
  resources :accounting_years
  get 'accounting_report/balance'
  get 'accounting_report/mayor'
  get 'diary_book/diario'


  resources :reservation_requests do
     collection do
      get 'report'
    end
  end
  resources :services do
     collection do
      get 'report'
    end
    get :autocomplete_service_nombre, :on => :collection
  end  
  resources :accounts do
    member do
      get :facturar
    end
    collection do
      get 'report'
    end
  end
  resources :invoices, :except => [:edit]
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
  get 'dashboard/new'
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
