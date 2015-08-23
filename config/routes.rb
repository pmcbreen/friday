Rails.application.routes.draw do
	root 'welcome#index'
	get 'welcome/index'

  get '/login' , to: 'login#login'
  post '/login' , to: 'login#login'
  get '/login/logout'#, to: 'login#logout'
	
	resources :parents
	
	resources :grades
	
	resources :students
    
  resources :teachers
  
	resources :divisions
    
  resources :offerings
    
  resources :members

	get '/student' , to: 'welcome#student'
	get '/parent' , to: 'welcome#parent'
	get '/teacher' , to: 'welcome#teacher'
	get '/admin' , to: 'welcome#admin'
    
    get '/password/:id' , to: 'members#password'
    post '/password' , to: 'members#password'
    
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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
