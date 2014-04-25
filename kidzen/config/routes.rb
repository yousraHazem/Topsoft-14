Kidzen::Application.routes.draw do
<<<<<<< HEAD
  get "group_members/index"
  resources :profile_musics
  root 'profile_musics#index'
  resources :groups
  resources :children
  resources :photos
<<<<<<< HEAD
  
 
=======
>>>>>>> 00a14087349e95f0319d8ced6a58e7e7eeb0b264

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
  resource :calendar, only: [:show], controller: :calendar
  resources :public, only: [:upload_photo, :uploading, :remove_photo]
  resources :public, :only: [:upload_photo, :uploading, :remove_photo]  
  resources :poll_questions
  resources :sessions, only: [:new, :create, :destroy]
    

  # children routes
  get "child/verify"
  post "child/new"
<<<<<<< HEAD
  get "children/verify"
  # This routes to enable getting info from invite page
  get "supervisors/invite" => 'supervisors#invite'
  post "supervisors/invite" => 'supervisors#invite'
  # Internationalization
  get 'change_locale', to: 'application#change_locale'
<<<<<<< HEAD

  # group members
  get '/group_members/:id/view' , to:  'group_members#view'
  get '/groups/:id/leave_group' , to:  'groups#leave_group'
  post '/groups/:id/leave_group' => 'groups#leave_group'
  post '/group_members/:id/view' => 'group_members#view'

=======
>>>>>>> 0b3b7371a98a3b7da7d9a2210a87550c23bbc7c7
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
=======
>>>>>>> 00a14087349e95f0319d8ced6a58e7e7eeb0b264


  
end

