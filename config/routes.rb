Letsjock::Application.routes.draw do
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :sports
  resources :competitions, :only => [:create, :update, :destroy]
  resources :teams, :only => [:create, :update, :destroy]
  resources :trains, :only => [:create, :update, :destroy]
  resources :results, :only => [:create, :update, :destroy]
  resources :recognitions, :only => [:create, :update, :destroy]
  resources :trainees, :only => [:create, :update, :destroy]
  resources :works, :only => [:create, :update, :destroy]
  resources :educations, :only => [:create, :update, :destroy]
  resources :photos
  resources :videos, :only => [:create, :update, :destroy]
  resources :events
  resources :messages, :only => [:create, :show]
  resources :relationships, :only => [:create, :destroy]
  resources :posts

  root :to => 'home#index'

  match '/beta' => 'home#beta', :as => :beta
  match '/about' => 'about#index', :as => :about
  match '/about/contact' => 'about#contact', :as => :contact_us
  match '/news' => 'feed#index', :as => :news
  match '/welcome' => 'welcome#index', :as => :welcome
  match '/signup' => 'users#new', :as => :signup
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/profile/:id' => 'users#profile', :as => :profile
  match '/profile/:id/social' => 'users#social', :as => :social
  match '/profile/:id/pictures' => 'users#pictures', :as => :pictures
  match '/profile/:id/add_new' => 'users#add_new', :as => :add_new
  match 'profile/:id/add_new_working' => 'users#add_new_working', :as => :add_new_working
  match 'profile/:id/add_new_educational' => 'users#add_new_educational', :as => :add_new_educational
  match '/profile/:id/edit_profile' => 'users#edit_profile', :as => :edit_profile
  match '/profile/:id/remove_profile' => 'users#remove_profile', :as => :remove_profile
  match '/notification/:id' => 'users#read_notification', :as => :follow_notification
  match '/search' => 'users#search', :as => :search
  match '/events/:id/join' => 'events#join', :as => :join
  match '/events/:id/disjoin' => 'events#disjoin', :as => :disjoin
  match '/events/:id/new_admin' => 'events#new_admin', :as => :event_new_admin
  match '/inbox'=> 'messages#inbox', :as => :inbox
  match '/inbox/new'=> 'messages#new', :as => :new_message
  match '/profile/:id/follow' => 'relationships#create', :as => :follow
  match '/profile/:id/unfollow' => 'relationships#destroy', :as => :unfollow
  match '/profile/:id/read_all' => 'users#read_all_notifications', :as => :read_all
  match '/profile/:id/change_profile_pic' => 'users#change_profile_pic', :as => :change_profile_pic
  match '/profile/:id/change_bg_pic' => 'users#change_bg_pic', :as => :change_bg_pic
  match '/profile/:id/email_authentication/:token' => 'users#auth_email', :as => :auth_email
  match '/newprofile' => 'users#profile_new', :as => :newprofile
  match '/newsponsor' => 'users#sponsor_new', :as => :new_sponsor
  match '/createsponsor' => 'users#sponsor_create', :as => :create_sponsor
  match '/forgotten_password' => 'users#forgotten_password', :as => :forgotten_password
  match '/new_password_request' => 'users#new_password_request', :as => :new_password_request
  match '/confirmed_new_password/:token' => 'users#confirmed_new_password', :as => :confirmed_new_password
  match '/change_password' => 'users#change_password', :as => :change_password
  match '/profile/:id/edit_sponsor' => 'users#sponsor_edit', :as => :edit_sponsor
  match '/profile/:id/add_admin' => 'users#add_admin', :as => :add_admin
  match '/profile/:id/add_post' => 'posts#add_user_post', :as => :add_post
  match '/profile/:id/remove_post' => 'posts#remove_user_post', :as => :remove_post
  match '/profile/:id/new_event' => 'events#new', :as => :new_event
  match '/profile/:id/events' => 'users#events', :as => :user_events
  match '/profile/:id/new_event/add_sponsor' => 'events#add_sponsor', :as => :add_sponsor
  match '/profile/:id/like' => 'users#like', :as => :like
  match '/profile/:id/is_liked' => 'users#is_liked?', :as => :is_liked
  match '/profile/:id/certify' => 'users#certify', :as => :certify
  match '/add_comment' => 'users#add_comment', :as => :add_comment
  match '/settings' => 'settings#index', :as => :settings
  match '/forgotten_password' => 'users#forgotten_password', :as => :forgotten_password
  match '/new_password_request' => 'users#new_password_request', :as => :new_password_request
  match '/confirmed_new_password/:token' => 'users#confirmed_new_password', :as => :confirmed_new_password
  match '/change_password' => 'users#change_password', :as => :change_password
  match '/new_password_form' => 'settings#new_password_form', :as => :new_password_form
  match '/invite' => 'users#invite', :as => :invite
  match '/send_mail_auth' => 'users#send_mail_auth', :as => :send_mail_auth
  match 'auth/:provider/callback', :to => 'sessions#create'
  match 'auth/failure', :to => 'home#index'
  match '/follow_letsjock' => 'users#follow_letsjock', :as => :follow_letsjock
  match '/stadistics' => 'stats#index', :as => :stats
  match '/tags' => 'tags#index', :as => :tags
  match '/comparison' => 'users#comparison', :as => :comparison
  match '/compare' => 'users#compare', :as => :compare
  match '/typeahead' => 'users#typeahead', :as => :tags
  match '/add_tag' => 'users#add_tag', :as => :add_tag
  match '/add_user_tag' => 'users#add_user_tag', :as => :add_user_tag
  match '/add_iam_tag' => 'users#add_iam_tag', :as => :add_iam_tag
  match '/photos/:id' => 'photos#edit', :as => :photo
  match '/profile/:id/add-sport' => 'users#add_sport_profile', :as => :add_sport_profile
  match '/profile/:id/highlight' => 'users#highlight', :as => :highlight
  match '/ask_recommendation' => 'users#ask_recommendation', :as => :ask_recommendation
  match '/write_recommendation/:id' => 'users#write_recommendation', :as => :write_recommendation
  match '/profile/:id/create_recommendation' => 'users#create_recommendation', :as => :create_recommendation
  match '/ask_sponsoring' => 'users#ask_sponsoring', :as => :ask_sponsoring
  match '/confirm_sponsoring' => 'users#confirm_sponsoring', :as => :confirm_sponsoring
  match '/add_agent' => 'users#add_agent', :as => :add_agent
  
  get "javascripts/countries"
  get "javascripts/sports"
  get "javascripts/users"
  get "javascripts/states"

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
