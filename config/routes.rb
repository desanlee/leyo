Leyo::Application.routes.draw do
  devise_for :users

  resources :users
  
  root to: 'static_pages#home'

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact' 
  
  match '/travelplanindex',  :to => 'travelplans#index'
  match '/travelplancreate',  :to => 'travelplans#create'
  
  match '/travelnoteindex',  :to => 'travelnotes#index'
  match '/travelnotecreate',  :to => 'travelnotes#create'
  
  match '/newplan',  :to => 'travelplans#newplan'

  match '/localemanagement',  :to => 'locales#show'

  match 'travelnotes/:id/newnotemicropost' => 'travelnotes#newnotemicropost'
  match 'travelplans/:id/readview' => 'travelplans#readview'
  match 'travelnotes/:id/readview' => 'travelnotes#readview'
  match 'travelplans/:id/createnote' => 'travelplans#createnote'
  
  resources :microposts, only: [:create, :destroy]
  
  resources :planrelationships do
    member do
	  get :plan_id, :micropost_id, :positionindex
	end
  end
  
  resources :noterelationships do
    member do
    	    get :note_id, :micropost_id, :positionindex
	end
  end
  
  resources :traveltracks do
	member do
		get :plan_id, :startpoint, :terminal, :positionindex
	end
  end

  resources :notetracks do
	member do
		get :note_id, :startpoint, :terminal, :positionindex
	end
  end
  
  resources :travelplans do
    member do
      get :id, :microposts
    end
  end
 
  resources :travelnotes do
    member do
      get :id, :microposts
    end
  end
  
  resources :locales do
    member do
      get :localename, :localetype, :parent
    end
  end

  resources :followedlocales do
    member do
      get :user_id, :locale_id
    end
  end
  
  
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
