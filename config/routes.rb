Huodong::Application.routes.draw do
  get "blogs/index"
  get "chats/index"
  get "accounts/index"
  get "home/index"
  get "search/index"
  get "users/index"
  get "index/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'index#index'
  
  #for bind account
  get '/auth/:provider/callback' => 'accounts#bind'
  
  get '/about/index' => 'about#index'
  get '/abouts/client' => 'about#client'  
  
  get "/search" => "search#index", as: 'search'
  get "/u/:login" => "accounts#u", :login => /.+/, as: 'u'
 
  

  resources :accounts do 
    collection do
      get :ping
      get :profile
      get :add
      get :login
      get :logout
      get :bind
      #post
      post :login
      post :bind
    end
  end
  
  resources :blogs do
    collection do 
      get :list
      get :tag
    end    
  end
  
 
  
  resources :chats do
    collection do 
      get :waterfall
      get :list
      get :apply
      get :confirm
      post :confirm
    end   
     
  end
  
  resources :abouts do
    collection do 
      get :client
    end    
  end
  
  
  namespace :cpanel do
      root :to => "home#index"
      resources :blogs
      resources :posts do 
        collection do
          post :preview
        end
      end

      resources :chats
      resources :accounts do 
        collection do
          get :merge
          post :merge
        end
        member do
          get 'up'
          get 'down'
        end
      end
 

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
