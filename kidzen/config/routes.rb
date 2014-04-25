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
  resources :public, only: [:upload_photo, :uploading, :remove_photo]  
  resources :poll_questions
  resources :sessions, only: [:new, :create, :destroy]
    

  # children routes
  get "child/verify"
  post "child/new"



  
end

