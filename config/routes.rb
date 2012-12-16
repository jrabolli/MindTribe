MindTribe::Application.routes.draw do

  resources :folders
  match "browse/:folder_id" => "pages#browse", :as => "browse"  
  
  #for creating folders insiide another folder  
  match "browse/:folder_id/new_folder" => "folders#new", :as => "new_sub_folder"
  
  #for renaming a folder  
  match "browse/:folder_id/rename" => "folders#edit", :as => "rename_folder"  
  
  #for sharing the folder
  match "pages/share" => "pages#share"  


  resources :clippings
  match 'clippings/get/:id' => 'clippings#get', :as => 'download'
  
  #for uploading files to folders  
  match "browse/:folder_id/new_file" => "clippings#new", :as => "new_sub_file"  

  resources :tribes
  match '/createtribe', :to => 'tribes#new'

  resources :users do
    member do
      get :following, :followers
    end
  end
  
  #get "sessions/new"

  #resources :users

  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
      
  match '/help',    to: 'pages#help'
  match '/about',   to: 'pages#about'
  match '/contact', to: 'pages#contact'

  match '/clippingsHome', :to => 'pages#clippings_home'

  root :to => 'pages#home'
  

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
  # match ':controller(/:action(/:id(.:format)))'
end
