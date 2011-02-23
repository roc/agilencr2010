Agilencr2011::Application.routes.draw do

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'

	root :to => "home#index"

	get "pages/about"
	get "pages/venue"
	get "pages/contact_us"
	get "pages/agenda"
	get "pages/register"

	get "details/bharti"
	get "details/shaik"
	get "details/pete"
	get "details/sanjiv"
	get "details/mehjabeen"
	get "details/ruchika"
	get "details/kanchan"
	get "details/olav"
	get "details/vibhu"
	get "details/asheesh"
	get "details/jonas"
	get "details/madhur"
	get "details/line"
	get "details/deepak"
	get "details/jesse"
	get "details/nilay"
	get "details/priyank"
	get "details/om"
	get "details/mayur"
	get "details/rashina"
	get "details/rohit"
	get "details/iwein"
	get "details/divakar"
	get "details/shweta"
	get "details/preethi"
	get "details/vivek"
	get "details/innovation_games"
	get "details/lightning"

	resources :users do
		resources :submissions
	end
	match 'submission/withdraw/:id' => 'submissions#withdraw'

	resources :sessions, :only => [:new, :create, :destroy]

	match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

end
