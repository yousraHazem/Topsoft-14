Kidzen::Application.routes.draw do

  root 'registered_users#show'
  # Internationalization
  get 'change_locale', to: 'application#change_locale'

  # RegisteredUser (generic) routes
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
  # End generic routes

  # Supervisor routes:
  # Confirm children page
  get "/confirm_children", to: 'supervisors#confirm_children'
  # Children notification actions
  get "/supervisors/dashboard", to: 'supervisors#show'
  put "/supervisors/accept_child", to: 'supervisors#accept_child'
  put "/supervisors/reject_child", to: 'supervisors#reject_child'
  get "/supervisors/signup", to: 'supervisors#signup'
  post "/supervisors/create", to: 'supervisors#create'
  # This routes to enable getting info from invite page
  get "supervisors/invite", to: 'supervisors#invite'
  post "supervisors/invite", to: 'supervisors#invite'

  # End supervisor routes


  # Session routes
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
  get '/signout', to: 'sessions#destroy'
  # Children Signup paths
  get '/signup', to: 'children#signup'
  post '/children/create', to: 'children#create'
  get '/children/show', to: 'children#show'  


  resources :public, :only => [:upload_photo, :uploading, :remove_photo]
  match '/uploadphoto', :to => 'public#upload_photo', via: [:get, :post]
  match '/uploadingphoto', :to => 'public#uploading', via: [:get, :post]
  match '/removephoto/:id', :to => 'public#remove_photo', via: [:get, :post]
  get '/children/show', to: 'children#show'
  # Sessions end

  # scratch pad

  # Some resources
  resources :videos
  resources :groups
  resources :events
  resources :polls
  resources :surveys
  resources :messages
  resources :profile_musics
  resources :searches
  resources :activities
  resources :photos
  resources :children
  resources :calendar, only: [:show], controller: :calendar
  resources :public, only: [:upload_photo, :uploading, :remove_photo]
  resources :public, only: [:upload_photo, :uploading, :remove_photo]  
  resources :poll_questions
  resources :sessions, only: [:new, :create, :destroy]
  resources :group_members

  
  get "group_members/index"
  get "group_members/new"
  get "group_members/create"
  get "group_members/show"
  get "group_members/destroy"
  get "groups/:id/membership_requests" , to: 'group_members#membership_requests'
  get "groups/:id/membership_requests" , to: 'group_members#accept_membership_request'
  get "groups/:id/membership_requests" , to: 'group_members#reject_membership_request'
  get '/group_members/:id/view' , to:  'group_members#view'
  post '/group_members/:id/view' => 'group_members#view'  
  get '/group_members/:id/leave_group' , to:  'group_members#leave_group'
  post '/group_members/:id/leave_group' => 'group_members#leave_group'
  get '/group_members/:id/join_group' , to:  'group_members#join_group'
  post '/group_members/:id/join_group' => 'group_members#join_group'    
  get "friendships/view_my_friends"
  get "friendships/view_pending_friendship_requests"
  get "friendships/accept_reject_friend_request"  
  get "friendships/send_friend_request"     

  # children routes
  get "child/verify"
  post "child/new"
  get "children/verify"
  # Internationalization
  get 'change_locale', to: 'application#change_locale'

  #resources :public, :only => [:upload_photo, :uploading, :remove_photo]  
  #resources :registered_users



  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  # topics routes
  get "topics/index"
  get "topics/show"
end

