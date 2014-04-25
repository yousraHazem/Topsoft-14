Kidzen::Application.routes.draw do

  resources :groups
  resources :children
  resources :photos


  get '/registered_user', to: 'registered_users#show'

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
  get "calendar/show"
  resource :calendar, only: [:show], controller: :calendar
  resources :public, :only => [:upload_photo, :uploading, :remove_photo]

  # Session routes
  resources :sessions, only: [:new, :create, :destroy]
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
  resources :events
  resources :polls
  resources :surveys
  resources :groups
  resources :group_members

  
  get "group_members/index"
  get "group_members/new"
  get "group_members/create"
  get "group_members/show"
  get "group_members/destroy"
  get "groups/:id/membership_requests" , to: 'group_members#membership_requests'
  get "groups/:id/membership_requests" , to: 'group_members#accept_membership_request'
  get "groups/:id/membership_requests" , to: 'group_members#reject_membership_request'
  
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

end

