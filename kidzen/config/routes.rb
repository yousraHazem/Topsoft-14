Kidzen::Application.routes.draw do
  resources :profile_musics


  root 'profile_musics#index'
  resources :groups
  resources :children
  resources :photos



  resources :groups
  resources :children
  resources :photos


  get '/registered_user', to: 'registered_users#show'
  get '/profile', to: 'registered_users#show'

  # Unique url for every user to use it to access the profile(by now to access simple information until profile story).
  # username will be the same as in the url /show/"username".
  # Author: Ammar ELWazeer
  get '/show/:username', to: 'registered_users#show_user'
  # Settings' actions
  post '/settings', to: 'registered_users#set_settings'
  get '/settings', to: 'registered_users#settings'


  # Lists pending notifications
  get "/notifications/pending", to: 'notifications#pending'

  # Confirm children page
  get "/confirm_children", to: 'supervisors#confirm_children'

  # Children notification actions
  get "/supervisors/dashboard", to: 'supervisors#show'
  put "/supervisors/accept_child", to: 'supervisors#accept_child'
  put "/supervisors/reject_child", to: 'supervisors#reject_child'
  get "/supervisors/signup", to: 'supervisors#signup'
  post "/supervisors/create", to: 'supervisors#create'




  resources :public, :only => [:upload_photo, :uploading, :remove_photo]  
  resources :poll_questions


  get "calendar/show"
  resource :calendar, only: [:show], controller: :calendar
  resources :public, :only => [:upload_photo, :uploading, :remove_photo]



  resources :registered_users
  


  

  # Session routes
  resources :sessions, only: [:new, :create, :destroy]
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
  get '/signout', to: 'sessions#destroy'

  # Children Signup paths
  get '/signup', to: 'children#signup'
  post '/children/create', to: 'children#create'
  get '/children/show', to: 'children#show'

  resources :groups
  

  resources :events
  resources :polls
  resources :surveys
  resources :groups
  resources :profile_musics

  get "children/verify"

  resources :searches
  resources :events
  resources :activities
  get "child/verify"
  post "child/new"

  get "children/verify"

  # This routes to enable getting info from invite page

  get "supervisors/invite" => 'supervisors#invite'
  post "supervisors/invite" => 'supervisors#invite'

  # Internationalization
  get 'change_locale', to: 'application#change_locale'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  # get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  # get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  # resources :products

  # Example resource route with options:
  # resources :products do
  # member do
  # get 'short'
  # post 'toggle'
  # end
  #
  # collection do
  # get 'sold'
  # end
  # end

  # Example resource route with sub-resources:
  # resources :products do
  # resources :comments, :sales
  # resource :seller
  # end

  # Example resource route with more complex sub-resources:
  # resources :products do
  # resources :comments
  # resources :sales do
  # get 'recent', on: :collection
  # end
  # end

  # Example resource route with concerns:
  # concern :toggleable do
  # post 'toggle'
  # end
  # resources :posts, concerns: :toggleable
  # resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  # namespace :admin do
  # # Directs /admin/products/* to Admin::ProductsController
  # # (app/controllers/admin/products_controller.rb)
  # resources :products
  # end
end

